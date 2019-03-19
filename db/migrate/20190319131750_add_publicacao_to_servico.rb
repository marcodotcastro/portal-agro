class AddPublicacaoToServico < ActiveRecord::Migration[5.2]
  def change
    add_column :servicos, :published_at, :date
  end
end
