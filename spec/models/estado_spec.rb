require 'rails_helper'

RSpec.describe Estado, type: :model do

  before(:all) do
    @estado = create(:estado)
  end

  it "um estado" do
    expect(@estado.nome).to eq("Goiás")
  end

  it "criando um estado" do
    estado = build(:estado, nome: "São Paulo")

    expect(estado).to be_valid
  end

end
