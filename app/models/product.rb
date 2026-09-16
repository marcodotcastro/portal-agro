class Product < ApplicationRecord
  extend FriendlyId
  paginates_per 12

  enum :inspection_seal, { sim: 0, sie: 1, sif: 2 }

  scope :published, -> { joins(:producer).where.not(producers: { published_at: nil }).where.not(published_at: nil) }

  belongs_to :producer, optional: true
  belongs_to :category, optional: true
  belongs_to :quality, optional: true
  has_many :harvests, dependent: :destroy
  has_many :livestocks, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :video, dependent: :destroy

  has_one_attached :cover_image
  has_many_attached :photos

  friendly_id :name, use: :slugged

  validates :name, :price, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name description price producer_id category_id quality_id inspection_seal created_at id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[producer category quality harvests livestocks]
  end
end
