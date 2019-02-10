class Produto < ApplicationRecord
  belongs_to :produtor
  belongs_to :categoria
  belongs_to :qualidade
end
