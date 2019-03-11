# == Schema Information
#
# Table name: produtos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  nome         :string
#  preco        :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  categoria_id :bigint(8)
#  produtor_id  :bigint(8)
#  qualidade_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_categoria_id  (categoria_id)
#  index_produtos_on_produtor_id   (produtor_id)
#  index_produtos_on_qualidade_id  (qualidade_id)
#  index_produtos_on_slug          (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (categoria_id => categorias.id)
#  fk_rails_...  (produtor_id => produtores.id)
#  fk_rails_...  (qualidade_id => qualidades.id)
#

class Produto < ApplicationRecord
  extend FriendlyId

  belongs_to :produtor
  belongs_to :categoria
  belongs_to :qualidade
  has_many :producoes, :dependent => :destroy
  has_one :video, :dependent => :destroy
  
  has_one_attached :capa
  has_many_attached :fotos
  
  accepts_nested_attributes_for :video, allow_destroy: true
  accepts_nested_attributes_for :producoes, allow_destroy: true

  friendly_id :friendly_url, use: :slugged

  def foto_capa_url
      #FIXME: Código duplicado
      foto_vazia = "https://bikepower.com.br/images/sem_foto.png"
      
      self.capa.attached? ? self.capa : foto_vazia
  end
  
  def producao
    if self.producoes
     self.producoes.last.numero.to_s + " " + self.producoes.last.unidade + "/" + self.producoes.last.periodo
    end
  end
  
  def evolucao
    if self.producoes
      ultima_e_penultima = self.producoes.last(2)
      alteracao = (((ultima_e_penultima.last.numero.to_f / ultima_e_penultima.first.numero.to_f) - 1) * 100).round(2)
      
      if alteracao >= 0
        "um aumento de #{alteracao}%" 
      else
        "uma diminuição de #{alteracao * -1}%"
      end
      
    end
  end

  def friendly_url
    self.nome
  end

  def should_generate_new_friendly_id?
    nome_changed? || super
  end
  
end
