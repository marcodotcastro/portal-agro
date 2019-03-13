class CreateProducoes < ActiveRecord::Migration[5.2]
  def change
    create_table :producoes do |t|
      t.integer :numero
      t.integer :medida, default: 0
      t.integer :periodo, default: 0
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end
