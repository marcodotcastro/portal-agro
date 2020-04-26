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

require 'rails_helper'

describe "Produtor", type: :model do

  before(:all) do
    @produtor = create(:produtor, :com_produtos, :com_servicos)
  end

  it "com produtos" do
    expect(@produtor.produtos.first.nome).to eq("Leite 6")
    expect(@produtor.nome).to eq("José")
  end

  it "com serviços" do
    expect(@produtor.servicos.first.nome).to eq("Roçar 4")
    expect(@produtor.nome).to eq("José")
  end

end
