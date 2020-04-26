# == Schema Information
#
# Table name: cidades
#
#  id         :bigint(8)        not null, primary key
#  nome       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  estado_id  :bigint(8)
#
# Indexes
#
#  index_cidades_on_estado_id  (estado_id)
#  index_cidades_on_slug       (slug)
#
# Foreign Keys
#
#  fk_rails_...  (estado_id => estados.id)
#

class Cidade < ApplicationRecord
  extend FriendlyId

  belongs_to :estado, optional: true
  has_many :produtores, :class_name => 'Produtor'

  friendly_id :friendly_url, use: :slugged

  validates :nome, :estado_id, presence: true

  def friendly_url
    self.nome
  end

  def should_generate_new_friendly_id?
    nome_changed? || super
  end

end
