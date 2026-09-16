class Order < ApplicationRecord
  belongs_to :product

  enum :status, {
    new_order: 0,
    contacted: 1,
    completed: 2,
    cancelled: 3
  }

  validates :customer_name, :customer_contact, :product, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
