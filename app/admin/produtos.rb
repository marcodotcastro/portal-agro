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
  filter :producao
  filter :preco

  index do
    selectable_column
    column :foto do |obj|
        image_tag obj.foto, size: "50x50"
    end
    column :nome
    column :descricao
    column :producao
    column :preco
    column :produtor, sortable: :name do |obj|
      link_to obj.produtor.nome, admin_produtor_path(obj.produtor)
    end
    column :categoria, sortable: :name do |obj|
      link_to obj.categoria.nome, admin_categoria_path(obj.categoria)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :produtor_id, :label => 'Produtor', :as => :select, :collection => Produtor.all.map{|u| ["#{u.nome}", u.id]}
      f.input :categoria_id, :label => 'Categoria', :as => :select, :collection => Categoria.all.map{|u| ["#{u.nome}", u.id]}
      f.input :nome
      f.input :descricao, as: :text
      f.input :producao
      f.input :preco
      f.input :video
      f.input :foto
      actions
    end
  end
  
  show do
    attributes_table do 
      row :foto do |obj|
        image_tag obj.foto, size: "300x200"
      end
      row :nome
      row :descricao
      row :producao
      row :preco
      row :video
      row :produtor do |obj|
        link_to obj.produtor.nome, admin_produtor_path(obj.produtor)
      end
      row :categoria do |obj|
        link_to obj.categoria.nome, admin_categoria_path(obj.categoria)
      end
      row :created_at
      row :updated_at
    end
  end


end
