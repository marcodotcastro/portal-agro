ActiveAdmin.register Produto do
  menu priority: 2

  permit_params :nome, :descricao, :producao, :preco, :video, :foto, :produtor_id, :categoria_id
  
  filter :produtor, collection: -> {
    Produtor.all.map { |map| [map.nome, map.id] }
  }
  filter :categoria, collection: -> {
    Categoria.all.map { |map| [map.nome, map.id] }
  }
  
  filter :nome
  filter :producao, label: "Produção"
  filter :preco, label: "Preço"

  form do |f|
    f.inputs do
      f.input :produtor_id, :label => 'Produtor', :as => :select, :collection => Produtor.all.map{|u| ["#{u.nome}", u.id]}
      f.input :categoria_id, :label => 'Categoria', :as => :select, :collection => Categoria.all.map{|u| ["#{u.nome}", u.id]}
      f.input :nome
      f.input :descricao
      f.input :producao
      f.input :preco
      f.input :video
      f.input :foto
      actions
    end
  end
  
  index do
    selectable_column
    
    column "Produtor", sortable: :name do |obj|
      link_to obj.produtor.nome, admin_produtor_path(obj)
    end
    column "Nome", :nome
    column "Descrição", :descricao
    column "Produção", :producao
    column "Preço", :producao
    column "Categoria", sortable: :name do |obj|
      link_to obj.categoria.nome, admin_categoria_path(obj)
    end
    
    actions
  end

end
