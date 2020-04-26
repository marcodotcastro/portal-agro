# == Schema Information
#
# Table name: produtores
#
#  id                      :bigint(8)        not null, primary key
#  apelido                 :string
#  cartao                  :boolean
#  dap                     :boolean
#  email                   :string
#  endereco                :string
#  licenciamento_ambiental :integer
#  nome                    :string
#  pessoa_juridica         :boolean
#  published_at            :date
#  slug                    :string
#  sobrenome               :string
#  telefone                :string
#  whatsapp                :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cidade_id               :bigint(8)
#
# Indexes
#
#  index_produtores_on_cidade_id  (cidade_id)
#  index_produtores_on_slug       (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class ProdutoresController < ApplicationController
  before_action :set_produtor, only: [:show]

  def index
    @q = Produtor.published.ransack(params[:q])
    @produtores = @q.result(distinct: true).page(params[:page])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    ahoy.track(@produtor.nome, {produtor_id: @produtor.id})

    @produtos = @produtor.produtos.page(params[:page])
    @servicos = @produtor.servicos.page(params[:page])

    respond_to do |format|
      if params[:paginate].eql? "produto"
        format.js {render "produtos/index"}
      elsif params[:paginate].eql? "servico"
        format.js {render "servicos/index"}
      end
      format.html
    end
  end

  private

  def set_produtor
    @produtor = Produtor.friendly.find(params[:id])
  end

end
