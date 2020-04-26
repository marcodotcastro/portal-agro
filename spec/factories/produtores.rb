# == Schema Information
#
# Table name: produtores
#
#  id                      :bigint(8)        not null, primary key
#  apelido                 :string
#  cartao                  :boolean
#  dap                     :boolean
#  email                   :string
#  endereco                :string
#  licenciamento_ambiental :integer
#  nome                    :string
#  pessoa_juridica         :boolean
#  published_at            :date
#  slug                    :string
#  sobrenome               :string
#  telefone                :string
#  whatsapp                :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cidade_id               :bigint(8)
#
# Indexes
#
#  index_produtores_on_cidade_id  (cidade_id)
#  index_produtores_on_slug       (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

FactoryBot.define do
  factory :produtor do
    nome {"José"}
    sobrenome {"Silva"}
    apelido {"Zé"}
    cartao {true}
    dap {true}
    perfil {fixture_file_upload(Rails.root.join('spec', 'imagens', 'jose-silva-perfil.jpg'), 'image/png')}
    email {"email@gmail.com"}
    endereco {"Rua 123"}
    licenciamento_ambiental {:lp}
    pessoa_juridica {true}
    telefone {"61988776655"}
    whatsapp {true}
    association :cidade, :factory => :cidade


    trait :com_produtos do
      after(:create) do |produtor|
        create_list(:produto, 3, produtor: produtor)
      end
    end

    trait :com_servicos do
      after(:create) do |produtor|
        create_list(:servico, 3, produtor: produtor)
      end
    end

    trait :com_produtos_e_servicos do
      after(:create) do |produtor|
        create_list(:produto, 3, produtor: produtor)
      end
      after(:create) do |produtor|
        create_list(:servico, 3, produtor: produtor)
      end
    end

  end
end
