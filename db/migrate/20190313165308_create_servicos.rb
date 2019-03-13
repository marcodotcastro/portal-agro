class CreateServicos < ActiveRecord::Migration[5.2]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.string :descricao
      t.string :preco
      t.integer :medida, default: 0
      t.references :produtor, foreign_key: true

      t.timestamps
    end
  end
end
