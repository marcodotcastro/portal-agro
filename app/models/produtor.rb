class Produtor < ApplicationRecord
    has_many :produtos
    has_many :videos, :dependent => :destroy
    
    accepts_nested_attributes_for :videos, allow_destroy: true
end
