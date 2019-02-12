class Produto < ApplicationRecord
  belongs_to :produtor
  belongs_to :categoria
  belongs_to :qualidade
  has_one :video, :dependent => :destroy
  has_many :fotos, :dependent => :destroy
  
  accepts_nested_attributes_for :video, allow_destroy: true
  accepts_nested_attributes_for :fotos, allow_destroy: true
  
  def foto_principal_url
    #FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"
    foto_principal = self.fotos.where(principal: true)
    foto_principal.empty? ? foto_vazia : foto_principal.take.url
  end
  
end
