ActiveAdmin.register Cidade do
  menu parent: "Configurações"
  breadcrumb do
    ['admin', 'configurações', 'cidades']
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  permit_params :nome

  filter :nome
  filter :estado, collection: -> {
    Estado.all.map {|map| [map.nome, map.id]}
  }

  form do |f|
    f.inputs do
      f.input :estado_id, :as => :select, :collection => Estado.all.map {|u| ["#{u.nome}", u.id]}
      f.input :nome

      actions
    end
  end

  index do
    selectable_column
    column :estado, sortable: :name do |obj|
      link_to obj.estado.nome, admin_estado_path(obj.estado)
    end
    column :nome

    actions
  end

  show title: proc {|p| "Cidade: " + p.nome} do
    attributes_table do
      row :estado do |obj|
        link_to obj.estado.nome, admin_estado_path(obj.estado)
      end
      row :nome
    end
  end
end
