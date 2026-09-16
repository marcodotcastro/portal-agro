require "test_helper"

class ProducersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producer = Producer.create!(name: "Fazenda Bela Vista", published_at: Time.current)
  end

  test "should get index" do
    get producers_url
    assert_response :success
    assert_select "h2", text: /Produtores/
  end

  test "should show producer" do
    get producer_url(@producer)
    assert_response :success
    assert_select "h2", text: /Fazenda Bela Vista/
  end
end
