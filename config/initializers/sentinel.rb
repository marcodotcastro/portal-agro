# frozen_string_literal: true

require_relative "../../lib/volt_sentinel_client"

VoltSentinelClient.configure do |config|
  config.endpoint = ENV.fetch("SENTINEL_URL", "https://status.marcocastro.pro")
  config.api_key = ENV.fetch("SENTINEL_API_KEY", "jELXEo8wMLdwRihemkArGKwN")
  config.project_name = "Portal Agro"
  config.logger = Rails.logger
end

# Subscribe to Rails 7/8 Error Reporting framework
if defined?(Rails.error) && Rails.error.respond_to?(:subscribe)
  Rails.error.subscribe(VoltSentinelClient::ErrorSubscriber.new)
end
