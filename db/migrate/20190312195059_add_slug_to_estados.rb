class AddSlugToEstados < ActiveRecord::Migration[5.2]
  def change
    add_column :estados, :slug, :string
    add_index :estados, :slug
  end
end
