class Cidade < ApplicationRecord
  belongs_to :estado, optional: true
  has_many :produtores, :class_name => 'Produtor'
end
