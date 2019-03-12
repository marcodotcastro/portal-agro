class Cidade < ApplicationRecord
  belongs_to :estado, optional: true
end
