# == Schema Information
#
# Table name: servicos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  nome         :string
#  preco        :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  categoria_id :bigint(8)
#  servicor_id  :bigint(8)
#  qualidade_id :bigint(8)
#
# Indexes
#
#  index_servicos_on_categoria_id  (categoria_id)
#  index_servicos_on_servicor_id   (servicor_id)
#  index_servicos_on_qualidade_id  (qualidade_id)
#  index_servicos_on_slug          (slug)
#
# Foreign Keys
#
#  fk_rails_...  (categoria_id => categorias.id)
#  fk_rails_...  (servicor_id => servicores.id)
#  fk_rails_...  (qualidade_id => qualidades.id)
#

class ServicosController < ApplicationController
  before_action :set_servico, only: [:show]
   
  def index
    @q = Servico.ransack(params[:q])
    @servicos = @q.result(distinct: true)
  end

  def show
  end
  
  private
    def set_servico
      @servico = Servico.friendly.find(params[:id])
    end

end
