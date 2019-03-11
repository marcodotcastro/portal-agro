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
