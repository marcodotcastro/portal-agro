require 'rails_helper'

RSpec.describe Cidade, type: :model do

  before(:all) do
    @cidade = create(:cidade)
  end

  it "uma cidade" do
    expect(@cidade.nome).to eq("Corumbá de Goiás")
    expect(@cidade.estado.nome).to eq("Goiás")
  end

  it "criando uma cidade" do
    cidade = build(:cidade, nome: "Cocalzinho")

    expect(cidade).to be_valid
  end


end
