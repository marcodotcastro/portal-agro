ActiveAdmin.register Produto do
  menu priority: 2

  permit_params :nome, :descricao, :producao, :preco, :video, :foto, :produtor_id, :categoria_id, :qualidade_id,
    videos_attributes: [:id, :nome, :descricao, :codigo, :_destroy]
  
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
    column :qualidade, sortable: :name do |obj|
      link_to obj.qualidade.nome, admin_qualidade_path(obj.qualidade)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :produtor_id, :as => :select, :collection => Produtor.all.map{|u| ["#{u.nome}", u.id]}
      f.input :categoria_id, :as => :select, :collection => Categoria.all.map{|u| ["#{u.nome}", u.id]}
      f.input :qualidade_id, :as => :select, :collection => Qualidade.all.map{|u| ["#{u.nome}", u.id]}
      f.input :nome
      f.input :descricao, as: :text
      f.input :producao
      f.input :preco
      f.input :foto
      f.inputs do
        f.has_many :videos, allow_destroy: true, new_record: true do |a|
          a.input :nome
          a.input :descricao
          a.input :codigo
        end
      end
      actions
    end
  end
  
  show title: proc{|p| "Produto: " + p.nome }do
    attributes_table do 
      row :foto do |obj|
        image_tag obj.foto, size: "300x200"
      end
      row :nome
      row :descricao
      row :producao
      row :preco
      row :produtor do |obj|
        link_to obj.produtor.nome, admin_produtor_path(obj.produtor)
      end
      row :categoria do |obj|
        link_to obj.categoria.nome, admin_categoria_path(obj.categoria)
      end
      row :qualidade do |obj|
        link_to obj.qualidade.nome, admin_qualidade_path(obj.qualidade)
      end
      row :created_at
      row :updated_at
      panel "Vídeos" do
          table_for produto.videos do
              column  :nome
              column  :descricao
              column :codigo do |obj|
                  link_to "Assista" , "https://www.youtube.com/watch?v=#{obj.codigo}", target: "_blank"
              end
          end
      end
    end
  end

end
