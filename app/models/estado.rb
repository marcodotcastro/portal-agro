# == Schema Information
#
# Table name: estados
#
#  id         :bigint(8)        not null, primary key
#  nome       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_estados_on_slug  (slug)
#

class Estado < ApplicationRecord
  extend FriendlyId

  has_many :cidades

  friendly_id :friendly_url, use: :slugged

  validates :nome, presence: true

  def friendly_url
    self.nome
  end

  def should_generate_new_friendly_id?
    nome_changed? || super
  end

end
