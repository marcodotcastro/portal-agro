ActiveAdmin.register Servico do
  menu priority: 2
  breadcrumb do
    ['admin', 'serviços']
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  permit_params :capa, :nome, :descricao, :preco, :produtor_id,
                fotos: []

  filter :produtor, collection: -> {
    Produtor.all.map {|map| [map.nome, map.id]}
  }

  filter :nome
  filter :preco

  form do |f|
    f.inputs do
      f.input :capa, as: :file
      f.input :nome
      f.input :descricao, as: :text
      f.input :preco
      f.input :produtor_id, :as => :select, :collection => Produtor.all.map {|u| ["#{u.nome}", u.id]}
      f.input :fotos, as: :file, input_html: {multiple: true}

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
    column :preco
    column :produtor, sortable: :name do |obj|
      link_to obj.produtor.nome, admin_produtor_path(obj.produtor)
    end

    actions
  end

  show title: proc {|p| "Serviço: " + p.nome} do
    attributes_table do
      row :capa do |obj|
        image_tag obj.foto_capa_url, size: "50x50"
      end
      row :nome
      row :descricao
      row :medida do |servico|
        Servico.human_enum_name(:medidas, servico.medida)
      end
      row :preco
      row :produtor do |obj|
        link_to obj.produtor.nome, admin_produtor_path(obj.produtor)
      end
      row :created_at
      row :updated_at
      panel "Fotos" do
        table_for servico.fotos do
          column :foto do |obj|
            image_tag obj, size: "50x50"
          end
        end
      end
    end
  end

end
