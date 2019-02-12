class Produto < ApplicationRecord
  belongs_to :produtor
  belongs_to :categoria
  belongs_to :qualidade
  has_many :videos, :dependent => :destroy
  
  accepts_nested_attributes_for :videos, allow_destroy: true
end
