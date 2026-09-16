class Livestock < ApplicationRecord
  belongs_to :product, optional: true
end
