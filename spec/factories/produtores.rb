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

FactoryBot.define do
  factory :produtor do
    apelido {"Zé"}
    cartao {true}
    dap {true}
    perfil {fixture_file_upload(Rails.root.join('spec', 'imagens', 'jose-silva-perfil.jpg'), 'image/png')}
    email {"email@gmail.com"}
    endereco {"Rua 123"}
    licenciamento_ambiental {:lp}
    nome {"José"}
    pessoa_juridica {true}
    sobrenome {"Silva"}
    telefone {"61988776655"}
    whatsapp {true}
    association :cidade, :factory => :cidade

  end
end
