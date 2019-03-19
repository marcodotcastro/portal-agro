class AddPublicacaoToProdutor < ActiveRecord::Migration[5.2]
  def change
    add_column :produtores, :published_at, :date
  end
end
