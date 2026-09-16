require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producer = Producer.create!(name: "Fazenda Cerrado", published_at: Time.current)
    @product = Product.create!(name: "Soja Especial", price: 140.0, producer: @producer, published_at: Time.current)
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_select "turbo-frame#products_results"
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
    assert_select "h2", text: /Soja Especial/
  end
end
