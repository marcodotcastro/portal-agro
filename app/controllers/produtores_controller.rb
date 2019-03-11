# == Schema Information
#
# Table name: produtores
#
#  id         :bigint(8)        not null, primary key
#  apelido    :string
#  cartao     :boolean
#  email      :string
#  endereco   :string
#  nome       :string
#  slug       :string
#  sobrenome  :string
#  telefone   :string
#  whatsapp   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_produtores_on_slug  (slug) UNIQUE
#

class ProdutoresController < ApplicationController
  before_action :set_produtor, only: [:show]
   
  def index
    @q = Produtor.ransack(params[:q])
    @produtores = @q.result(distinct: true)
  end
   
  def show
  end
  
  private
    def set_produtor
      @produtor = Produtor.friendly.find(params[:id])
    end

end
