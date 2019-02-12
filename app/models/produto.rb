class Produto < ApplicationRecord
  belongs_to :produtor
  belongs_to :categoria
  belongs_to :qualidade
  has_many :videos, :dependent => :destroy
  has_many :fotos, :dependent => :destroy
  
  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :fotos, allow_destroy: true
end
