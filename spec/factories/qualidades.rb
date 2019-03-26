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

FactoryBot.define do
  factory :qualidade do
    nome {"Tradicional"}
    descricao {"São produtos cultivados ou criados nas formas antigas, ou seja a base de herbicidas, agrotóxico e pesticida."}
  end
end
