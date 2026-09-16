class City < ApplicationRecord
  belongs_to :state, optional: true
  has_many :producers, dependent: :nullify
  validates :name, presence: true
end
