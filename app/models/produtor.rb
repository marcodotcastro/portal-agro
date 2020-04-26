# == Schema Information
#
# Table name: produtores
#
#  id                      :bigint(8)        not null, primary key
#  apelido                 :string
#  cartao                  :boolean
#  dap                     :boolean
#  email                   :string
#  endereco                :string
#  licenciamento_ambiental :integer
#  nome                    :string
#  pessoa_juridica         :boolean
#  published_at            :date
#  slug                    :string
#  sobrenome               :string
#  telefone                :string
#  whatsapp                :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cidade_id               :bigint(8)
#
# Indexes
#
#  index_produtores_on_cidade_id  (cidade_id)
#  index_produtores_on_slug       (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class Produtor < ApplicationRecord
  include ProdutorHelper
  extend FriendlyId
  visitable :ahoy_visit
  paginates_per 12

  enum licenciamento_ambiental: [:lp, :li, :lo]

  scope :published, -> {where.not(published_at: nil)}

  belongs_to :cidade, optional: true
  has_many :produtos
  has_many :servicos
  has_one :video, :dependent => :destroy
  has_many :historias, :dependent => :destroy

  has_one_attached :perfil
  has_many_attached :fotos

  accepts_nested_attributes_for :video, allow_destroy: true
  accepts_nested_attributes_for :historias, allow_destroy: true

  friendly_id :friendly_url, use: :slugged

  validates :apelido, :endereco, :nome, :sobrenome, :telefone, :cidade_id, presence: true
  validates :perfil, attached: true

  # TODO: Bug do ahoy, verificar se existe alguma solução melhor
  def set_ahoy_visit
  end

  def friendly_url
    nome_completo(self)
  end

  def should_generate_new_friendly_id?
    nome_changed? || super
  end

end
