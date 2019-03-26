# == Schema Information
#
# Table name: produtos
#
#  id            :bigint(8)        not null, primary key
#  descricao     :string
#  nome          :string
#  preco         :decimal(, )
#  published_at  :date
#  selo_inspecao :integer
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  categoria_id  :bigint(8)
#  produtor_id   :bigint(8)
#  qualidade_id  :bigint(8)
#
# Indexes
#
#  index_produtos_on_categoria_id  (categoria_id)
#  index_produtos_on_produtor_id   (produtor_id)
#  index_produtos_on_qualidade_id  (qualidade_id)
#  index_produtos_on_slug          (slug)
#

require 'rails_helper'

RSpec.describe Produto, type: :model do

  before(:all) do
    @produto = create(:produto)
  end

  it "um produto" do
    expect(@produto.nome).to eq("Leite")
  end

  it "criando um produto" do
    produto = build(:produto, nome: "Soja")

    expect(produto).to be_valid
  end

end
