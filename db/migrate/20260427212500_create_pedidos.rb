class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.references :produto, null: false, foreign_key: true
      t.string :nome, null: false
      t.string :contato, null: false
      t.integer :quantidade, null: false
      t.text :observacoes
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
