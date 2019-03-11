class AddSlugToProdutores < ActiveRecord::Migration[5.2]
  def change
    add_column :produtores, :slug, :string
    add_index :produtores, :slug, unique: true
  end
end
