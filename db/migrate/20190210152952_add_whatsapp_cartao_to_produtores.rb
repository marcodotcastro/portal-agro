class AddWhatsappCartaoToProdutores < ActiveRecord::Migration[5.2]
  def change
    add_column :produtores, :whatsapp, :boolean
    add_column :produtores, :cartao, :boolean
  end
end
