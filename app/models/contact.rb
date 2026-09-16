class Contact < ApplicationRecord
  validates :name, :email, :message, presence: true
end
