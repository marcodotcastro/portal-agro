class Producer < ApplicationRecord
  extend FriendlyId
  paginates_per 12

  enum :environmental_license, { lp: 0, li: 1, lo: 2 }

  scope :published, -> { where.not(published_at: nil) }

  belongs_to :city, optional: true
  has_many :products, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_one :video, dependent: :destroy

  has_one_attached :profile_image
  has_many_attached :photos

  friendly_id :name, use: :slugged

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name nickname last_name phone address city_id created_at id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[city products services]
  end
end
