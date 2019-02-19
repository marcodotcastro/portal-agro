class Producao < ApplicationRecord
  belongs_to :produto, optional: true
  
  enum unidade: [ :unitario, :litro, :quilo, :saco ]
  enum periodo: [ :dia, :semana, :mes, :ano ]
  
end
