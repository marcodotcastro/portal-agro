# frozen_string_literal: true

require "test_helper"

class SentinelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/sentinel"
    assert_response :success
    assert_select "h1", /Sentinel Playground — Portal Agro/
    assert_select "input[name='error_class']"
    assert_select "input[name='message']"
    assert_select "select[name='target_agent']"
    assert_select "textarea[name='prescriptive_action']"
  end

  test "should get health check on /up" do
    get "/up"
    assert_response :success
    assert_includes response.body, "background-color: green"
  end

  test "should simulate incident via post" do
    orig = VoltSentinelClient.method(:send_payload)
    VoltSentinelClient.define_singleton_method(:send_payload) do |_payload, _config|
      Net::HTTPResponse.new("1.1", "201", "Created")
    end

    begin
      post "/sentinel/simulate", params: {
        error_class: "ZeroDivisionError",
        message: "Divisao por zero simulada no Portal Agro",
        prescriptive_action: "Adicionar validacao no model Produtor",
        target_agent: "google_jules"
      }
      assert_redirected_to "/sentinel"
      follow_redirect!
      assert_response :success
      assert_match(/Incidente simulado com sucesso/, response.body)
    ensure
      VoltSentinelClient.define_singleton_method(:send_payload, orig)
    end
  end

  test "should simulate incident via json" do
    orig = VoltSentinelClient.method(:send_payload)
    VoltSentinelClient.define_singleton_method(:send_payload) do |_payload, _config|
      Net::HTTPResponse.new("1.1", "201", "Created")
    end

    begin
      post "/sentinel/simulate", params: {
        error_class: "ZeroDivisionError",
        message: "Divisao por zero simulada",
        target_agent: "google_jules"
      }, as: :json
      assert_response :success
      json = JSON.parse(response.body)
      assert_equal "dispatched", json["status"]
      assert_equal "google_jules", json["target_agent"]
    ensure
      VoltSentinelClient.define_singleton_method(:send_payload, orig)
    end
  end
end
