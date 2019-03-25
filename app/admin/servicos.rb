ActiveAdmin.register Servico do
  menu priority: 2
  breadcrumb do
    ['admin', 'serviços']
  end

  action_item :publicar, only: :show do
    link_to "Publicar", publicar_admin_servico_path(servico), method: :put if !servico.published_at?
  end

  action_item :nao_publicar, only: :show do
    link_to "Não Publicar", nao_publicar_admin_servico_path(servico), method: :put if servico.published_at?
  end

  member_action :publicar, method: :put do
    servico = Servico.friendly.find(params[:id])
    servico.update(published_at: Time.zone.now)
    redirect_to admin_servico_path(servico)
  end

  member_action :nao_publicar, method: :put do
    servico = Servico.friendly.find(params[:id])
    servico.update(published_at: nil)
    redirect_to admin_servico_path(servico)
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
    column :capa do |servico|
      image_tag foto_capa_url(servico), size: "50x50"
    end
    column :visitas do |servico|
      visitas_ao_servico(servico)
    end
    column :nome
    column :descricao
    column :preco do |servico|
      servico_preco_completo(servico)
    end
    column :produtor, sortable: :name do |servico|
      link_to servico.produtor.nome, admin_produtor_path(servico.produtor)
    end

    actions
  end

  show title: proc {|p| "Serviço: " + p.nome} do
    attributes_table do
      row :capa do |servico|
        image_tag foto_capa_url(servico), size: "50x50"
      end
      row :nome
      row :descricao
      row :medida do |servico|
        Servico.human_enum_name(:medidas, servico.medida)
      end
      row :preco
      row :produtor do |servico|
        link_to servico.produtor.nome, admin_produtor_path(servico.produtor)
      end
      row :published_at
      row :created_at
      row :updated_at
      panel "Fotos" do
        table_for servico.fotos do
          column :foto do |foto|
            image_tag foto, size: "50x50"
          end
        end
      end
    end
  end

end
