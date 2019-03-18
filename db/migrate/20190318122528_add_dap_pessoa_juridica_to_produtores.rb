class AddDapPessoaJuridicaToProdutores < ActiveRecord::Migration[5.2]
  def change
    add_column :produtores, :dap, :boolean
    add_column :produtores, :pessoa_juridica, :boolean
  end
end
