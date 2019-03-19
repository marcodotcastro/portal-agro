# == Schema Information
#
# Table name: qualidades
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Qualidade < ApplicationRecord
  has_many :produtos

  validates :nome, :descricao, presence: true
end
