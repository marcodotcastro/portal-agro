class Harvest < ApplicationRecord
  belongs_to :product, optional: true
  enum :unit, { kg: 0, ton: 1, sack: 2, liter: 3 }
  enum :period, { monthly: 0, seasonal: 1, annual: 2 }
end
