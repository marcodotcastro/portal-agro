require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producer = Producer.create!(name: "Fazenda Cerrado Verde", published_at: Time.current)
    @product = Product.create!(name: "Milho Safra", price: 65.0, producer: @producer, published_at: Time.current)
  end

  test "should get root page" do
    get root_url
    assert_response :success
    assert_select "h2", text: /Agricultura Inteligente/
  end
end
