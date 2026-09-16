class Service < ApplicationRecord
  extend FriendlyId
  belongs_to :producer, optional: true
  friendly_id :name, use: :slugged
  validates :name, :price, presence: true
end
