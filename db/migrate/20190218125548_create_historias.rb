class CreateHistorias < ActiveRecord::Migration[5.2]
  def change
    create_table :historias do |t|
      t.datetime :data
      t.string :titulo
      t.string :descricao
      t.references :produtor, foreign_key: true

      t.timestamps
    end
  end
end
