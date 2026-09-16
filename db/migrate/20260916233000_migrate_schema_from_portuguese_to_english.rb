class MigrateSchemaFromPortugueseToEnglish < ActiveRecord::Migration[8.0]
  def change
    # 1. Drop dummy legacy products table if exists
    drop_table :products, if_exists: true

    # 2. Rename core domain tables
    rename_table :categorias, :categories
    rename_table :estados, :states
    rename_table :cidades, :cities
    rename_table :qualidades, :qualities
    rename_table :produtores, :producers
    rename_table :produtos, :products
    rename_table :criacoes, :livestocks
    rename_table :producoes, :harvests
    rename_table :pedidos, :orders
    rename_table :servicos, :services
    rename_table :historias, :stories
    rename_table :contatos, :contacts

    # 3. Rename columns in categories
    rename_column :categories, :nome, :name
    rename_column :categories, :descricao, :description

    # 4. Rename columns in states & cities
    rename_column :states, :nome, :name
    rename_column :cities, :nome, :name
    rename_column :cities, :estado_id, :state_id

    # 5. Rename columns in qualities
    rename_column :qualities, :nome, :name
    rename_column :qualities, :descricao, :description

    # 6. Rename columns in producers
    rename_column :producers, :nome, :name
    rename_column :producers, :telefone, :phone
    rename_column :producers, :endereco, :address
    rename_column :producers, :cartao, :accepts_card
    rename_column :producers, :apelido, :nickname
    rename_column :producers, :sobrenome, :last_name
    rename_column :producers, :cidade_id, :city_id
    rename_column :producers, :pessoa_juridica, :legal_entity
    rename_column :producers, :licenciamento_ambiental, :environmental_license

    # 7. Rename columns in products
    rename_column :products, :nome, :name
    rename_column :products, :descricao, :description
    rename_column :products, :preco, :price
    rename_column :products, :produtor_id, :producer_id
    rename_column :products, :categoria_id, :category_id
    rename_column :products, :qualidade_id, :quality_id
    rename_column :products, :selo_inspecao, :inspection_seal

    # 8. Rename columns in livestocks
    rename_column :livestocks, :data, :activity_date
    rename_column :livestocks, :titulo, :title
    rename_column :livestocks, :descricao, :description
    rename_column :livestocks, :produto_id, :product_id

    # 9. Rename columns in harvests
    rename_column :harvests, :numero, :amount
    rename_column :harvests, :medida, :unit
    rename_column :harvests, :periodo, :period
    rename_column :harvests, :produto_id, :product_id

    # 10. Rename columns in orders
    rename_column :orders, :produto_id, :product_id
    rename_column :orders, :nome, :customer_name
    rename_column :orders, :contato, :customer_contact
    rename_column :orders, :quantidade, :quantity
    rename_column :orders, :observacoes, :notes

    # 11. Rename columns in services
    rename_column :services, :nome, :name
    rename_column :services, :descricao, :description
    rename_column :services, :preco, :price
    rename_column :services, :medida, :unit
    rename_column :services, :produtor_id, :producer_id

    # 12. Rename columns in stories
    rename_column :stories, :data, :story_date
    rename_column :stories, :titulo, :title
    rename_column :stories, :descricao, :description
    rename_column :stories, :produtor_id, :producer_id

    # 13. Rename columns in contacts
    rename_column :contacts, :nome, :name
    rename_column :contacts, :telefone, :phone
    rename_column :contacts, :descricao, :message

    # 14. Rename columns in videos
    rename_column :videos, :nome, :title
    rename_column :videos, :descricao, :description
    rename_column :videos, :codigo, :embed_code
    rename_column :videos, :produtor_id, :producer_id
    rename_column :videos, :produto_id, :product_id
  end
end
