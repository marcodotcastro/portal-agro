class AddCidadeToProdutor < ActiveRecord::Migration[5.2]
  def change
    add_reference :produtores, :cidade, foreign_key: true
  end
end
