class Produto < ApplicationRecord
  belongs_to :produtor
  belongs_to :categoria
  belongs_to :qualidade
  has_one_attached :capa
  has_many_attached :fotos
  has_one :video, :dependent => :destroy
  has_many :fotos, :dependent => :destroy
  
  accepts_nested_attributes_for :video, allow_destroy: true
  accepts_nested_attributes_for :fotos, allow_destroy: true
  
  def foto_capa_url
      #FIXME: Código duplicado
      foto_vazia = "https://bikepower.com.br/images/sem_foto.png"
      
      self.capa.attached? ? self.capa : foto_vazia
    end
  
end
