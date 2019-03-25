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

class ProdutoresController < ApplicationController
  before_action :set_produtor, only: [:show]

  def index
    @q = Produtor.published.ransack(params[:q])
    @produtores = @q.result(distinct: true).page(params[:page])
  end

  def show
    ahoy.track(@produtor.nome, {produtor_id: @produtor.id})
  end

  private

  def set_produtor
    @produtor = Produtor.friendly.find(params[:id])
  end

end
