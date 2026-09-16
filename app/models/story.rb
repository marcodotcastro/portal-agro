class Story < ApplicationRecord
  belongs_to :producer, optional: true
  validates :title, presence: true
end
