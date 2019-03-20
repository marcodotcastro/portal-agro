class AddLicenciamentoAmbientalToProdutores < ActiveRecord::Migration[5.2]
  def change
    add_column :produtores, :licenciamento_ambiental, :integer
  end
end
