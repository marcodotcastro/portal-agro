ActiveAdmin.register Produto do
  menu priority: 2

  permit_params :capa, :nome, :descricao, :producao, :preco, :video, :produtor_id, :categoria_id, :qualidade_id, fotos: [],
    video_attributes: [:id, :nome, :descricao, :codigo, :_destroy],
    fotos_attributes: [:id, :nome, :descricao, :url, :principal, :_destroy]
  
  filter :produtor, collection: -> {
    Produtor.all.map { |map| [map.nome, map.id] }
  }
  filter :categoria, collection: -> {
    Categoria.all.map { |map| [map.nome, map.id] }
  }
  
  filter :nome
  filter :producao
  filter :preco

  form do |f|
    f.inputs do
      f.input :capa, as: :file
      f.input :nome
      f.input :descricao, as: :text
      f.input :producao
      f.input :preco
      f.input :produtor_id, :as => :select, :collection => Produtor.all.map{|u| ["#{u.nome}", u.id]}
      f.input :categoria_id, :as => :select, :collection => Categoria.all.map{|u| ["#{u.nome}", u.id]}
      f.input :qualidade_id, :as => :select, :collection => Qualidade.all.map{|u| ["#{u.nome}", u.id]}
      f.input :fotos, as: :file, input_html: { multiple: true}
      f.inputs do
        #FIXME: O cadastro has_one no activeadmin é o mesmo do has_many, manter o bug
        f.has_many :video, allow_destroy: true, new_record: true do |a|
          a.input :nome
          a.input :descricao, as: :text
          a.input :codigo
        end
      end
      actions
    end
  end

  index do
    selectable_column
    column :capa do |obj|
      image_tag obj.foto_capa_url, size: "50x50"
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

  show title: proc{|p| "Produto: " + p.nome }do
    attributes_table do
      row :capa do |obj|
       image_tag obj.foto_capa_url, size: "50x50"
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
      panel "Fotos" do	
        table_for produto.fotos do	
            column  :foto do |obj|	
                image_tag obj, size: "50x50"	
            end	
        end	
      end
      panel "Vídeo" do
        table_for produto.video do
          column :codigo do |obj|
            obj ? link_to("Assista" , "https://www.youtube.com/watch?v=#{obj.codigo}", target: "_blank") : ""
          end
          column  :nome
          column  :descricao
        end
      end
    end
  end

end
