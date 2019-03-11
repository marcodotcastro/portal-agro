class Produtor < ApplicationRecord
  has_many :produtos
  has_one :video, :dependent => :destroy
  has_many :historias, :dependent => :destroy

  has_one_attached :perfil
  has_many_attached :fotos

  accepts_nested_attributes_for :video, allow_destroy: true
  accepts_nested_attributes_for :historias, allow_destroy: true

  def foto_perfil_url
    #FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    self.perfil.attached? ? self.perfil : foto_vazia
  end

  def nome_completo
    self.nome + " " + self.sobrenome
  end
end
