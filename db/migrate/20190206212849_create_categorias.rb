class CreateCategorias < ActiveRecord::Migration[5.2]
  def change
    create_table :categorias do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
