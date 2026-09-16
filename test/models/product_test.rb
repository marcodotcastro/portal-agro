require "test_helper"

class ProductTest < ActiveSupport::TestCase
  setup do
    @producer = Producer.create!(name: "Fazenda Santa Rita", published_at: Time.current)
  end

  test "validates presence of name and price" do
    product = Product.new(producer: @producer)
    assert_not product.valid?
    assert_includes product.errors[:name], "não pode ficar em branco"
    assert_includes product.errors[:price], "não pode ficar em branco"
  end

  test "belongs to producer and creates slug" do
    product = Product.create!(name: "Milho Híbrido Safra", price: 85.50, producer: @producer, published_at: Time.current)
    assert_equal @producer, product.producer
    assert_equal "milho-hibrido-safra", product.slug
  end

  test "published scope returns only products with both producer and product published" do
    prod_pub = Product.create!(name: "Soja Grão", price: 130.0, producer: @producer, published_at: Time.current)
    prod_draft = Product.create!(name: "Feijão Preto", price: 90.0, producer: @producer, published_at: nil)

    assert_includes Product.published, prod_pub
    assert_not_includes Product.published, prod_draft
  end
end
