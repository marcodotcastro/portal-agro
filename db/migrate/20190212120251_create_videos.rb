class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :nome
      t.string :descricao
      t.string :codigo
      t.references :produtor, foreign_key: true
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
