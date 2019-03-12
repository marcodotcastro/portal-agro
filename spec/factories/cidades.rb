# == Schema Information
#
# Table name: cidades
#
#  id         :bigint(8)        not null, primary key
#  nome       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  estado_id  :bigint(8)
#
# Indexes
#
#  index_cidades_on_estado_id  (estado_id)
#  index_cidades_on_slug       (slug)
#
# Foreign Keys
#
#  fk_rails_...  (estado_id => estados.id)
#

FactoryBot.define do
  factory :cidade do
    nome {"Corumbá de Goiás"}
    association :estado, :factory => :estado
  end
end
