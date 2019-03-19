ActiveAdmin.register Produtor do
  menu priority: 1
  breadcrumb do
    ['admin', 'produtores']
  end

  action_item :publicar, only: :show do
    link_to "Publicar", publicar_admin_produtor_path(produtor), method: :put if !produtor.published_at?
  end

  action_item :nao_publicar, only: :show do
    link_to "Não Publicar", nao_publicar_admin_produtor_path(produtor), method: :put if produtor.published_at?
  end

  member_action :publicar, method: :put do
    produtor = Produtor.friendly.find(params[:id])
    produtor.update(published_at: Time.zone.now)
    redirect_to admin_produtor_path(produtor)
  end

  member_action :nao_publicar, method: :put do
    produtor = Produtor.friendly.find(params[:id])
    produtor.update(published_at: nil)
    redirect_to admin_produtor_path(produtor)
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  permit_params :perfil, :nome, :sobrenome, :telefone, :email, :endereco, :whatsapp, :cartao, :publicado_em, :cidade_id, fotos: [],
                video_attributes: [:id, :nome, :descricao, :codigo, :_destroy],
                fotos_attributes: [:id, :nome, :descricao, :url, :principal, :_destroy],
                historias_attributes: [:id, :data, :titulo, :descricao, :_destroy]

  filter :nome
  filter :apelido
  filter :dap
  filter :pessoa_juridica
  filter :cidade, collection: -> {
    Cidade.all.map {|map| [map.nome, map.id]}
  }

  form do |f|
    f.inputs do
      f.input :perfil, as: :file
      f.input :nome
      f.input :sobrenome
      f.input :telefone
      f.input :whatsapp
      f.input :dap
      f.input :pessoa_juridica
      f.input :cartao
      f.input :email
      f.input :endereco
      f.input :cidade_id, :as => :select, :collection => Cidade.all.map {|u| ["#{u.nome}", u.id]}
      f.input :fotos, as: :file, input_html: {multiple: true}
      f.inputs do
        #FIXME: O cadastro has_one no activeadmin é o mesmo do has_many, manter o bug
        f.has_many :video, allow_destroy: true, new_record: true do |a|
          a.input :codigo
          a.input :nome
          a.input :descricao, as: :text
        end
      end
      f.inputs do
        f.has_many :historias, allow_destroy: true, new_record: true do |a|
          a.input :data, as: :datepicker
          a.input :titulo
          a.input :descricao, as: :text
        end
      end

      f.actions
    end
  end

  index do
    selectable_column
    column :perfil do |obj|
      image_tag obj.foto_perfil_url, size: "50x50"
    end
    column :nome
    column :apelido
    column :telefone
    column :whatsapp
    column :dap
    column :pessoa_juridica
    column :estado, sortable: :name do |obj|
      link_to obj.cidade.estado.nome, admin_estado_path(obj.cidade.estado)
    end
    column :cidade, sortable: :name do |obj|
      link_to obj.cidade.nome, admin_cidade_path(obj.cidade)
    end

    actions
  end

  show title: proc {|p| "Produtor: " + p.nome} do
    attributes_table do
      row :perfil do |obj|
        image_tag obj.foto_perfil_url, size: "50x50"
      end
      row :nome
      row :sobrenome
      row :telefone
      row :dap
      row :pessoa_juridica
      row :whatsapp
      row :cartao
      row :email
      row :endereco
      row :cidade do |obj|
        link_to obj.cidade.nome, admin_cidade_path(obj.cidade)
      end
      row :estado do |obj|
        link_to obj.cidade.estado.nome, admin_estado_path(obj.cidade.estado)
      end
      row :published_at
      row :created_at
      row :updated_at
    end
    panel "Produtos" do
      table_for produtor.produtos do
        column :capa do |obj|
          image_tag obj.foto_capa_url, size: "50x50"
        end
        column :nome
        column :producao
        column :preco
        column "" do |obj|
          span link_to "Visualizar", admin_produto_path(obj)
          span link_to "Editar", edit_admin_produto_path(obj)
        end
      end
    end
    panel "Fotos" do
      table_for produtor.fotos do
        column :foto do |obj|
          image_tag obj, size: "50x50"
        end
      end
    end
    panel "Vídeo" do
      table_for produtor.video do
        column :codigo do |obj|
          obj ? link_to("Assista", "https://www.youtube.com/watch?v=#{obj.codigo}", target: "_blank") : ""
        end
        column :nome
        column :descricao
      end
    end
    panel "História" do
      table_for produtor.historias do
        column :data
        column :titulo
        column :descricao
      end
    end
  end
end
