require 'rails_helper'

RSpec.describe ProdutoHelper, type: :helper do

  describe "produto_preco_completo" do
    it "com produções" do
      produto = create(:produto, :com_producao)

      expect(helper.produto_preco_completo(produto)).to include("R$ 20,00 por unidade")
    end

    it "sem produções" do
      produto = create(:produto)

      expect(helper.produto_preco_completo(produto)).to include("Produção não cadastrada")
    end
  end
end
