class RemoveProducaoFromProduto < ActiveRecord::Migration[5.2]
  def change
    remove_column :produtos, :producao, :string
  end
end
