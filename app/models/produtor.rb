class Produtor < ApplicationRecord
    has_many :produtos
    has_one :video, :dependent => :destroy
    has_many :fotos, :dependent => :destroy
    has_many :historias, :dependent => :destroy
    
    accepts_nested_attributes_for :video, allow_destroy: true
    accepts_nested_attributes_for :fotos, allow_destroy: true
    accepts_nested_attributes_for :historias, allow_destroy: true
    
    def foto_principal_url
        #FIXME: Código duplicado
        foto_vazia = "https://bikepower.com.br/images/sem_foto.png"
        foto_principal = self.fotos.where(principal: true)
        foto_principal.empty? ? foto_vazia : foto_principal.take.url
    end
end
