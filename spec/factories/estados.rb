# == Schema Information
#
# Table name: estados
#
#  id         :bigint(8)        not null, primary key
#  nome       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_estados_on_slug  (slug)
#

FactoryBot.define do
  factory :estado do
    nome { "Goiás" }
  end
end
