class CreateContatos < ActiveRecord::Migration[5.2]
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.text :descricao

      t.timestamps
    end
  end
end
