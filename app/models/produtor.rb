class Produtor < ApplicationRecord
    has_many :produtos
    has_many :videos, :dependent => :destroy
    has_many :fotos, :dependent => :destroy
    
    accepts_nested_attributes_for :videos, allow_destroy: true
    accepts_nested_attributes_for :fotos, allow_destroy: true
end
