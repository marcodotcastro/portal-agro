FactoryBot.define do
  factory :cidade do
    nome {"Corumbá de Goiás"}
    association :estado, :factory => :estado
  end
end
