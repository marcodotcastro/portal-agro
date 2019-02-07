class Produto < ApplicationRecord
  belongs_to :produtor
  belongs_to :categoria
end
