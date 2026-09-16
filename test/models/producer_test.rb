require "test_helper"

class ProducerTest < ActiveSupport::TestCase
  test "validates presence of name" do
    producer = Producer.new(name: nil)
    assert_not producer.valid?
    assert_includes producer.errors[:name], "não pode ficar em branco"
  end

  test "generates slug on save" do
    producer = Producer.create!(name: "Fazenda Recanto Verde")
    assert_equal "fazenda-recanto-verde", producer.slug
  end

  test "published scope returns only records with published_at" do
    p1 = Producer.create!(name: "Produtor Ativo", published_at: Time.current)
    p2 = Producer.create!(name: "Produtor Rascunho", published_at: nil)

    assert_includes Producer.published, p1
    assert_not_includes Producer.published, p2
  end
end
