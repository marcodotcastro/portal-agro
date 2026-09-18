# frozen_string_literal: true

class SentinelController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:simulate]

  def index
    @endpoint = VoltSentinelClient.configuration.endpoint
    @project_name = VoltSentinelClient.configuration.project_name || "Portal Agro"
    @recent_simulations = session[:sentinel_simulations] || []
  end

  def simulate
    report_type = params[:report_type].presence || "improvement"
    target_agent = params[:target_agent].presence || "google_jules"
    error_class = params[:error_class].presence || (report_type == "improvement" ? "UI/UX Improvement" : "ZeroDivisionError")
    message = params[:message].presence || (report_type == "improvement" ? "O botão na tela de produtores está verde e deveria ser azul" : "Divisao por zero simulada no Portal Agro")
    prescriptive_action = params[:prescriptive_action].presence || (report_type == "improvement" ? "Alterar a cor do botão para azul (#2563eb) com fidelidade ao Volt Design System e cobrir com testes." : "Adicionar validacao no model Produtor para evitar divisao por zero no calculo de taxa")
    screen_ref = params[:screen].presence || "https://portalagro.marcocastro.pro/producers"

    backtrace = [
      "app/models/producer.rb:42:in `calculate_distribution_rate'",
      "app/controllers/producers_controller.rb:18:in `show'",
      "actionpack (7.1.0) lib/action_controller/metal/instrumentation.rb:19:in `process_action'",
      "railties (7.1.0) lib/rails/engine.rb:535:in `call'"
    ]

    context = {
      simulated: true,
      report_type: report_type,
      source: "portal_agro_sentinel",
      module: "laboratory/portal-agro",
      screen: screen_ref,
      error_class: error_class,
      prescriptive_action: prescriptive_action,
      target_agent: target_agent,
      user_agent: request.user_agent,
      ip: request.remote_ip,
      dispatched_at: Time.current.iso8601
    }

    # Despachar para POST https://status.marcocastro.pro/api/v1/incidents usando VoltSentinelClient
    response = VoltSentinelClient.notify(
      RuntimeError.new("#{error_class}: #{message}"),
      context: context,
      sync: true
    )

    simulation_record = {
      "report_type" => report_type,
      "error_class" => error_class,
      "message" => message,
      "prescriptive_action" => prescriptive_action,
      "target_agent" => target_agent,
      "dispatched_at" => Time.current.strftime("%d/%m/%Y %H:%M:%S"),
      "http_status" => response&.code || "200"
    }

    session[:sentinel_simulations] = [simulation_record] + (session[:sentinel_simulations] || []).first(4)

    respond_to do |format|
      format.html do
        flash[:notice] = report_type == "improvement" ? "Melhoria registrada com sucesso! Missão prescritiva despachada para o assistente." : "Incidente simulado com sucesso! Missão prescritiva despachada para o assistente."
        redirect_to "/sentinel"
      end
      format.json do
        render json: {
          status: "dispatched",
          report_type: report_type,
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
