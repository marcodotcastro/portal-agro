class AddSeloInspecaoToProdutos < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos, :selo_inspecao, :integer
  end
end
