# == Schema Information
#
# Table name: categorias
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Categoria < ApplicationRecord
    has_many :produtos
end
