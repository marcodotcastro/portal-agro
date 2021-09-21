# == Schema Information
#
# Table name: servicos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  medida       :integer          default("hora")
#  nome         :string
#  preco        :decimal(, )
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

class Servico < ApplicationRecord
  extend FriendlyId
  visitable :ahoy_visit
  paginates_per 12

  scope :published, -> {joins(:produtor).where.not(produtores: {published_at: nil}).where.not(published_at: nil)}

  belongs_to :produtor, optional: true

  has_one_attached :capa
  has_many_attached :fotos

  friendly_id :friendly_url, use: :slugged

  enum medida: [:hora, :dia, :mes, :fixo, :cabeca]

  validates :descricao, :medida, :nome, :preco, :produtor_id, presence: true
  validates :capa, attached: true

  # TODO: Bug do ahoy, verificar se existe alguma solução melhor
  def set_ahoy_visit
  end

  def friendly_url
    self.nome
  end

  def should_generate_new_friendly_id?
    nome_changed? || super
  end

end
