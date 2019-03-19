# == Schema Information
#
# Table name: servicos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  medida       :integer          default("hora")
#  nome         :string
#  preco        :string
#  published_at :date
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  produtor_id  :bigint(8)
#
# Indexes
#
#  index_servicos_on_produtor_id  (produtor_id)
#  index_servicos_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (produtor_id => produtores.id)
#

class ServicosController < ApplicationController
  before_action :set_servico, only: [:show]
   
  def index
    @q = Servico.published.ransack(params[:q])
    @servicos = @q.result(distinct: true)
  end

  def show
  end
  
  private
    def set_servico
      @servico = Servico.friendly.find(params[:id])
    end

end
