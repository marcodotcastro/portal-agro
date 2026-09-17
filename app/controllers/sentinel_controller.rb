# frozen_string_literal: true

class SentinelController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:simulate]

  def index
    @endpoint = VoltSentinelClient.configuration.endpoint
    @project_name = VoltSentinelClient.configuration.project_name || "Portal Agro"
    @recent_simulations = session[:sentinel_simulations] || []
  end

  def simulate
    error_class = params[:error_class].presence || "ZeroDivisionError"
    message = params[:message].presence || "Divisao por zero simulada no Portal Agro"
    prescriptive_action = params[:prescriptive_action].presence || "Adicionar validacao no model Produtor para evitar divisao por zero no calculo de taxa"
    target_agent = params[:target_agent].presence || "google_jules"

    backtrace = [
      "app/models/producer.rb:42:in `calculate_distribution_rate'",
      "app/controllers/producers_controller.rb:18:in `show'",
      "actionpack (7.1.0) lib/action_controller/metal/instrumentation.rb:19:in `process_action'",
      "railties (7.1.0) lib/rails/engine.rb:535:in `call'"
    ]

    context = {
      simulated: true,
      source: "portal_agro_sentinel",
      module: "laboratory/portal-agro",
      user_agent: request.user_agent,
      ip: request.remote_ip,
      dispatched_at: Time.current.iso8601
    }

    # Despachar para POST https://status.marcocastro.pro/api/v1/incidents usando Volt::Sentinel::Client
    response = Volt::Sentinel::Client.notify(
      RuntimeError.new("#{error_class}: #{message}"),
      context: context,
      sync: true,
      prescriptive_action: prescriptive_action,
      target_agent: target_agent,
      error_class: error_class,
      message: message,
      backtrace: backtrace
    )

    simulation_record = {
      "error_class" => error_class,
      "message" => message,
      "prescriptive_action" => prescriptive_action,
      "target_agent" => target_agent,
      "dispatched_at" => Time.current.strftime("%d/%m/%Y %H:%M:%S"),
      "http_status" => response&.code || "unknown"
    }

    session[:sentinel_simulations] = [simulation_record] + (session[:sentinel_simulations] || []).first(4)

    respond_to do |format|
      format.html do
        flash[:notice] = "Incidente simulado com sucesso! Missão prescritiva despachada para o Sentinel Engine (#{target_agent})."
        redirect_to "/sentinel"
      end
      format.json do
        render json: {
          status: "dispatched",
          error_class: error_class,
          message: message,
          prescriptive_action: prescriptive_action,
          target_agent: target_agent,
          sentinel_response_code: response&.code
        }
      end
    end
  end
end
