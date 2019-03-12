class AddSlugToProdutos < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :slug, :string
    add_index :produtos, :slug
  end
end
