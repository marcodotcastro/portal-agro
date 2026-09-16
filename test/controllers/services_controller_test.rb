require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producer = Producer.create!(name: "Fazenda AgroServ", published_at: Time.current)
    @service = Service.create!(name: "Pulverização de Precisão", price: 350.0, unit: "hectare", producer: @producer)
  end

  test "should get index" do
    get services_url
    assert_response :success
    assert_select "h2", text: /Serviços Agrícolas/
  end

  test "should show service" do
    get service_url(@service)
    assert_response :success
    assert_select "h2", text: /Pulverização de Precisão/
  end
end
