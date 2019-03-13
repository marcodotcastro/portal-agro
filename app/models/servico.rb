# == Schema Information
#
# Table name: servicos
#
#  id          :bigint(8)        not null, primary key
#  descricao   :string
#  medida      :integer          default("hora")
#  nome        :string
#  preco       :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  produtor_id :bigint(8)
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

class Servico < ApplicationRecord
  extend FriendlyId

  belongs_to :produtor

  has_one_attached :capa
  has_many_attached :fotos

  friendly_id :friendly_url, use: :slugged

  enum medida: [:hora, :dia, :mes, :fixo]

  def foto_capa_url
    #FIXME: Código duplicado
    foto_vazia = "https://bikepower.com.br/images/sem_foto.png"

    self.capa.attached? ? self.capa : foto_vazia
  end

  def preco_completo
    self.preco + " " + self.medida
  end

  def friendly_url
    self.nome
  end

  def should_generate_new_friendly_id?
    nome_changed? || super
  end

end
