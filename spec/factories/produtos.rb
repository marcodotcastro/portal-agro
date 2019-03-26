# == Schema Information
#
# Table name: produtos
#
#  id            :bigint(8)        not null, primary key
#  descricao     :string
#  nome          :string
#  preco         :decimal(, )
#  published_at  :date
#  selo_inspecao :integer
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  categoria_id  :bigint(8)
#  produtor_id   :bigint(8)
#  qualidade_id  :bigint(8)
#
# Indexes
#
#  index_produtos_on_categoria_id  (categoria_id)
#  index_produtos_on_produtor_id   (produtor_id)
#  index_produtos_on_qualidade_id  (qualidade_id)
#  index_produtos_on_slug          (slug)
#

FactoryBot.define do
  factory :produto do
    nome {"Leite"}
    descricao {"O leite é bom..."}
    preco {20.0}
    selo_inspecao {1}
    capa {fixture_file_upload(Rails.root.join('spec', 'imagens', 'jose-silva-leite-capa.jpg'), 'image/png')}
    association :produtor, :factory => :produtor
    association :qualidade, :factory => :qualidade
    association :categoria, :factory => :categoria

    trait :com_producao do
      after :create do |produto|
        create_list :producao, 3, produto: produto
      end
    end

  end
end
