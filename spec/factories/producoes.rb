# == Schema Information
#
# Table name: producoes
#
#  id         :bigint(8)        not null, primary key
#  medida     :integer          default("unidade")
#  numero     :integer
#  periodo    :integer          default("dia")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  produto_id :bigint(8)
#
# Indexes
#
#  index_producoes_on_produto_id  (produto_id)
#
# Foreign Keys
#
#  fk_rails_...  (produto_id => produtos.id)
#

FactoryBot.define do
  factory :producao do
    medida {:unidade}
    numero {100}
    periodo {:dia}
  end
end
