class Produtor < ApplicationRecord
  extend FriendlyId

  has_many :produtos
  has_one :video, :dependent => :destroy
  has_many :historias, :dependent => :destroy

  has_one_attached :perfil
  has_many_attached :fotos

  accepts_nested_attributes_for :video, allow_destroy: true
  accepts_nested_attributes_for :historias, allow_destroy: true

  friendly_id :friendly_url, use: :slugged

  def foto_perfil_url
    #FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    self.perfil.attached? ? self.perfil : foto_vazia
  end

  def nome_completo
    self.nome + " " + self.sobrenome
  end

  def friendly_url
    self.nome_completo + " de Corumbá de Goiás"
  end

  def should_generate_new_friendly_id?
    nome_changed? || super
  end

end
