class CreateCriacoes < ActiveRecord::Migration[5.2]
  def change
    create_table :criacoes do |t|
      t.datetime :data
      t.string :titulo
      t.string :descricao
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
