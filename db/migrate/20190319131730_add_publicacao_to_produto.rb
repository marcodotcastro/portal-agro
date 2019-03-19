class AddPublicacaoToProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :published_at, :date
  end
end
