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

class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show]

  def index
    @q = Produto.published.ransack(params[:q])
    @produtos = @q.result(distinct: true)
  end

  def show
    ahoy.track(@produto.nome, {produto_id: @produto.id})
  end

  private

  def set_produto
    @produto = Produto.friendly.find(params[:id])
  end

end
