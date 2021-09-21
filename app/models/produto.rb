# == Schema Information
#
# Table name: produtos
#
#  id            :bigint(8)        not null, primary key
#  descricao     :string
#  nome          :string
#  preco         :decimal(, )
#  published_at  :date
#  selo_inspecao :integer
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  categoria_id  :bigint(8)
#  produtor_id   :bigint(8)
#  qualidade_id  :bigint(8)
#
# Indexes
#
#  index_produtos_on_categoria_id  (categoria_id)
#  index_produtos_on_produtor_id   (produtor_id)
#  index_produtos_on_qualidade_id  (qualidade_id)
#  index_produtos_on_slug          (slug)
#
# Foreign Keys
#
#  fk_rails_...  (categoria_id => categorias.id)
#  fk_rails_...  (produtor_id => produtores.id)
#  fk_rails_...  (qualidade_id => qualidades.id)
#

class Produto < ApplicationRecord
  extend FriendlyId
  visitable :ahoy_visit
  paginates_per 12

  enum selo_inspecao: [:sim, :sie, :sif]

  scope :published, -> {joins(:produtor).where.not(produtores: {published_at: nil}).where.not(published_at: nil)}

  belongs_to :produtor, optional: true
  belongs_to :categoria, optional: true
  belongs_to :qualidade, optional: true
  has_many :producoes, :dependent => :destroy
  has_one :video, :dependent => :destroy
  has_many :criacoes, :dependent => :destroy

  has_one_attached :capa
  has_many_attached :fotos

  accepts_nested_attributes_for :video, allow_destroy: true
  accepts_nested_attributes_for :producoes, allow_destroy: true
  accepts_nested_attributes_for :criacoes, allow_destroy: true

  friendly_id :friendly_url, use: :slugged

  validates :nome, :descricao, :preco, :categoria_id, :produtor_id, :qualidade_id, presence: true
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
