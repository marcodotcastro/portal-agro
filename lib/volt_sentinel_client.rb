# frozen_string_literal: true

require "net/http"
require "uri"
require "json"
require "time"

module VoltSentinelClient
  class Configuration
    attr_accessor :endpoint, :api_key, :project_name, :open_timeout, :read_timeout, :logger, :enabled

    def initialize
      @endpoint = ENV.fetch("SENTINEL_URL", "https://status.marcocastro.pro")
      @api_key = ENV["SENTINEL_API_KEY"]
      @project_name = ENV["SENTINEL_PROJECT_NAME"]
      @open_timeout = 1.5
      @read_timeout = 1.5
      @logger = defined?(Rails) && Rails.respond_to?(:logger) ? Rails.logger : nil
      @enabled = true
    end
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration) if block_given?
      configuration
    end

    def reset_configuration!
      @configuration = Configuration.new
    end

    def notify(exception, context: {}, sync: false, prescriptive_action: nil, target_agent: nil, error_class: nil, message: nil, backtrace: nil)
      config = configuration
      return nil unless config.enabled
      return nil if config.endpoint.nil? || config.endpoint.to_s.strip.empty?
      return nil if config.api_key.nil? || config.api_key.to_s.strip.empty?

      payload = build_payload(
        exception,
        context,
        prescriptive_action: prescriptive_action,
        target_agent: target_agent,
        error_class: error_class,
        message: message,
        backtrace: backtrace
      )

      worker = proc do
        send_payload(payload, config)
      rescue => e
        config.logger&.warn("[VoltSentinelClient] Failed to deliver incident: #{e.message}")
        nil
      end

      if sync
        worker.call
      else
        Thread.new(&worker)
      end
    rescue => e
      configuration.logger&.warn("[VoltSentinelClient] Failed to dispatch incident: #{e.message}")
      nil
    end

    def build_payload(exception, context = {}, prescriptive_action: nil, target_agent: nil, error_class: nil, message: nil, backtrace: nil)
      err_class = error_class || (exception.is_a?(Exception) ? exception.class.name : "StandardError")
      err_msg = message || (exception.is_a?(Exception) ? exception.message.to_s : exception.to_s)
      err_trace = backtrace || (exception.is_a?(Exception) && exception.backtrace ? exception.backtrace.first(25) : caller.first(25))

      ctx = {}
      ctx[:project_name] = configuration.project_name if configuration.project_name
      ctx[:environment] = if defined?(Rails) && Rails.respond_to?(:env)
        Rails.env.to_s
      else
        ENV.fetch("RACK_ENV", ENV.fetch("RAILS_ENV", "development"))
      end
      ctx[:timestamp] = Time.now.utc.iso8601
      ctx.merge!(context) if context.is_a?(Hash)

      payload = {
        error_class: err_class,
        message: err_msg,
        backtrace: err_trace,
        context: ctx
      }
      payload[:prescriptive_action] = prescriptive_action if prescriptive_action
      payload[:target_agent] = target_agent if target_agent
      payload
    end

    def send_payload(payload, config)
      base = config.endpoint.to_s.sub(%r{/+\z}, "")
      endpoint_path = base.end_with?("/api/v1/incidents") ? base : "#{base}/api/v1/incidents"
      uri = URI.parse(endpoint_path)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == "https")
      http.open_timeout = config.open_timeout || 2.0
      http.read_timeout = config.read_timeout || 2.0

      request = Net::HTTP::Post.new(uri.request_uri)
      request["Content-Type"] = "application/json"
      request["X-Sentinel-Token"] = config.api_key.to_s
      request.body = JSON.generate(payload)

      http.request(request)
    end
  end

  class ErrorSubscriber
    def report(error, handled:, severity:, context: {}, source: nil, **kwargs)
      extra_context = {
        handled: handled,
        severity: severity
      }
      extra_context[:source] = source if source
      extra_context.merge!(kwargs) unless kwargs.empty?

      merged_context = context.is_a?(Hash) ? context.merge(extra_context) : extra_context
      VoltSentinelClient.notify(error, context: merged_context)
    rescue => e
      VoltSentinelClient.configuration.logger&.warn("[VoltSentinelClient::ErrorSubscriber] Failed to report error: #{e.message}")
      nil
    end
  end
end

module Volt
  module Sentinel
    Client = ::VoltSentinelClient
  end
end
