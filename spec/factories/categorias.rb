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

FactoryBot.define do
  factory :categoria do
    nome {"Animal"}
    descricao {"São os produtos de origem animal. Ex: Leite, frango, gado etc"}
  end
end
