class AddSlugToCidades < ActiveRecord::Migration[5.2]
  def change
    add_column :cidades, :slug, :string
    add_index :cidades, :slug, unique: true
  end
end
