ActiveAdmin.register Produto do
  menu priority: 2
  breadcrumb do
    ['admin', 'produtos']
  end

  action_item :publicar, only: :show do
    link_to "Publicar", publicar_admin_produto_path(produto), method: :put if !produto.published_at?
  end

  action_item :nao_publicar, only: :show do
    link_to "Não Publicar", nao_publicar_admin_produto_path(produto), method: :put if produto.published_at?
  end

  member_action :publicar, method: :put do
    produto = Produto.friendly.find(params[:id])
    produto.update(published_at: Time.zone.now)
    redirect_to admin_produto_path(produto)
  end

  member_action :nao_publicar, method: :put do
    produto = Produto.friendly.find(params[:id])
    produto.update(published_at: nil)
    redirect_to admin_produto_path(produto)
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  permit_params :capa, :nome, :descricao, :preco, :video, :produtor_id, :categoria_id, :qualidade_id,
                fotos: [],
                video_attributes: [:id, :nome, :descricao, :codigo, :_destroy],
                producoes_attributes: [:id, :numero, :medida, :periodo, :_destroy],
                criacoes_attributes: [:id, :data, :titulo, :descricao, :_destroy]

  filter :produtor, collection: -> {
    Produtor.all.map {|map| [map.nome, map.id]}
  }
  filter :categoria, collection: -> {
    Categoria.all.map {|map| [map.nome, map.id]}
  }
  filter :nome
  filter :preco
  filter :selo_inspecao, as: :select, :collection => Produto.selo_inspecoes.map {|k, v| [Produto.human_enum_name(:selo_inspecoes, k), v]}


  form do |f|
    f.inputs do
      f.input :capa, as: :file
      f.input :nome
      f.input :descricao, as: :text
      f.input :preco
      f.input :selo_inspecao, :as => :select do |produto|
        Produto.human_enum_name(:selo_inspecoes, produto.selo_inspecao)
      end
      f.input :produtor_id, :as => :select, :collection => Produtor.all.map {|u| ["#{u.nome}", u.id]}
      f.input :categoria_id, :as => :select, :collection => Categoria.all.map {|u| ["#{u.nome}", u.id]}
      f.input :qualidade_id, :as => :select, :collection => Qualidade.all.map {|u| ["#{u.nome}", u.id]}
      f.input :fotos, as: :file, input_html: {multiple: true}
      f.inputs do
        f.has_many :producoes, allow_destroy: true, new_record: true do |a|
          a.input :numero
          a.input :medida
          a.input :periodo
        end
      end
      f.inputs do
        f.has_many :criacoes, allow_destroy: true, new_record: true do |a|
          a.input :data, as: :datepicker
          a.input :titulo
          a.input :descricao, as: :text
        end
      end
      f.inputs do
        # FIXME: O cadastro has_one no activeadmin é o mesmo do has_many, manter o bug
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
    column :capa do |produto|
      image_tag foto_capa_url(produto), size: "50x50"
    end
    column :visitas do |produto|
      visitas_ao_produto(produto)
    end
    column :nome
    column :descricao
    column :preco do |produto|
      produto_preco_completo(produto)
    end
    column :produtor, sortable: :name do |produto|
      link_to produto.produtor.nome, admin_produtor_path(produto.produtor)
    end
    column :categoria, sortable: :name do |produto|
      link_to produto.categoria.nome, admin_categoria_path(produto.categoria)
    end
    column :qualidade, sortable: :name do |produto|
      link_to produto.qualidade.nome, admin_qualidade_path(produto.qualidade)
    end

    actions
  end

  show title: proc {|p| "Produto: " + p.nome} do
    attributes_table do
      row :capa do |produto|
        image_tag foto_capa_url(produto), size: "50x50"
      end
      row :nome
      row :descricao
      row :preco do |produto|
        produto_preco_completo(produto)
      end
      row :selo_inspecao, :as => :select do |produto|
        Produto.human_enum_name(:selo_inspecoes, produto.selo_inspecao)
      end
      row :produtor do |produto|
        link_to produto.produtor.nome, admin_produtor_path(produto.produtor)
      end
      row :categoria do |produto|
        link_to produto.categoria.nome, admin_categoria_path(produto.categoria)
      end
      row :qualidade do |produto|
        link_to produto.qualidade.nome, admin_qualidade_path(produto.qualidade)
      end
      row :published_at
      row :created_at
      row :updated_at
      panel "Fotos" do
        table_for produto.fotos do
          column :foto do |foto|
            image_tag foto, size: "50x50"
          end
        end
      end
      panel "Vídeo" do
        table_for produto.video do
          column :codigo do |video|
            video ? link_to("Assista", "https://www.youtube.com/watch?v=#{video.codigo}", target: "_blank") : ""
          end
          column :nome
          column :descricao
        end
      end
      panel "Produções" do
        table_for produto.producoes do
          column :numero
          column :medida do |producao|
            Producao.human_enum_name(:medidas, producao.medida)
          end
          column :periodo do |producao|
            Producao.human_enum_name(:periodos, producao.periodo)
          end
        end
      end
      panel "Criações" do
        table_for produto.criacoes do
          column :data
          column :titulo
          column :descricao
        end
      end
    end
  end

end
