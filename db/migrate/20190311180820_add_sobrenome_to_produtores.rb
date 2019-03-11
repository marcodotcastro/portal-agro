class AddSobrenomeToProdutores< ActiveRecord::Migration[5.2]
  def change
    add_column :produtores, :sobrenome, :string
  end
end
