class AddSlugToServicos < ActiveRecord::Migration[5.2]
  def change
    add_column :servicos, :slug, :string
    add_index :servicos, :slug, unique: true
  end
end
