require "test_helper"

class OrderTest < ActiveSupport::TestCase
  setup do
    @producer = Producer.create!(name: "Cooperativa Agro", published_at: Time.current)
    @product = Product.create!(name: "Trigo Moído", price: 72.0, producer: @producer, published_at: Time.current)
  end

  test "validates customer details and quantity" do
    order = Order.new(product: @product)
    assert_not order.valid?
    assert_includes order.errors[:customer_name], "não pode ficar em branco"
    assert_includes order.errors[:customer_contact], "não pode ficar em branco"
    assert_includes order.errors[:quantity], "não pode ficar em branco"
  end

  test "valid order saves with default status" do
    order = Order.create!(
      product: @product,
      customer_name: "Cerealista Central",
      customer_contact: "compras@central.agr.br",
      quantity: 50
    )
    assert order.persisted?
    assert_equal 50, order.quantity
    assert_equal "new_order", order.status
  end

  test "rejects non-positive quantity" do
    order = Order.new(
      product: @product,
      customer_name: "Cliente Teste",
      customer_contact: "cliente@teste.com",
      quantity: 0
    )
    assert_not order.valid?
    assert_includes order.errors[:quantity], "deve ser maior que 0"
  end
end
