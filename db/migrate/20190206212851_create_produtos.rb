class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.string :producao
      t.decimal :preco
      t.references :produtor, foreign_key: true
      t.references :categoria, foreign_key: true
      t.references :qualidade, foreign_key: true

      t.timestamps
    end
  end
end
