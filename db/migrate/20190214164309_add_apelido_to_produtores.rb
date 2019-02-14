class AddApelidoToProdutores < ActiveRecord::Migration[5.2]
  def change
     add_column :produtores, :apelido, :string
  end
end
