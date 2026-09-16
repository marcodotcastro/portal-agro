require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producer = Producer.create!(name: "Cooperativa Vale do Rio", published_at: Time.current)
    @product = Product.create!(name: "Milho Safra Alta", price: 78.0, producer: @producer, published_at: Time.current)
  end

  test "should get index" do
    get orders_url
    assert_response :success
    assert_select "h2", text: /Painel Cooperativo de Pedidos/
  end

  test "should get new simulation with product" do
    get new_order_url(product_id: @product.id)
    assert_response :success
    assert_select "div[data-controller='calculator']"
  end

  test "should create order simulation" do
    assert_difference("Order.count") do
      post orders_url, params: {
        order: {
          product_id: @product.id,
          customer_name: "Indústria de Alimentos Silva",
          customer_contact: "compras@indsilva.com.br",
          quantity: 100,
          notes: "Entrega em silo cooperativo"
        }
      }
    end

    assert_redirected_to orders_url
    follow_redirect!
    assert_select "strong", text: "Indústria de Alimentos Silva"
  end
end
