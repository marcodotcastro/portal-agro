ActiveAdmin.register Produto do
  menu priority: 2

  permit_params :nome, :descricao, :producao, :preco, :video, :foto, :produtor_id, :categoria_id, :qualidade_id,
    videos_attributes: [:id, :nome, :descricao, :codigo, :_destroy],
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
      f.input :produtor_id, :as => :select, :collection => Produtor.all.map{|u| ["#{u.nome}", u.id]}
      f.input :categoria_id, :as => :select, :collection => Categoria.all.map{|u| ["#{u.nome}", u.id]}
      f.input :qualidade_id, :as => :select, :collection => Qualidade.all.map{|u| ["#{u.nome}", u.id]}
      f.input :nome
      f.input :descricao, as: :text
      f.input :producao
      f.input :preco
      f.inputs do
        f.has_many :fotos, allow_destroy: true, new_record: true do |a|
          a.input :url
          a.input :principal
          a.input :nome
          a.input :descricao, as: :text
        end
      end
      f.inputs do
        f.has_many :videos, allow_destroy: true, new_record: true do |a|
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
    column :foto do |obj|
      #TODO: Mover essa imagem para um local correto
      foto_vazia = "https://bikepower.com.br/images/sem_foto.png"
      foto_principal = obj.fotos.where(principal: true)
      foto = foto_principal.empty? ? foto_vazia : foto_principal.take.url
  
      image_tag foto, size: "50x50"
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
            image_tag obj.url, size: "50x50"
          end
          column  :nome
          column  :descricao
          column  :principal
        end
      end
      panel "Vídeos" do
        table_for produto.videos do
          column :codigo do |obj|
              link_to "Assista" , "https://www.youtube.com/watch?v=#{obj.codigo}", target: "_blank"
          end
          column  :nome
          column  :descricao
        end
      end
    end
  end

end
