ActiveAdmin.register Produtor do
    menu priority: 1

    permit_params :nome, :telefone, :email, :endereco, :whatsapp, :cartao,
        video_attributes: [:id, :nome, :descricao, :codigo, :_destroy],
        fotos_attributes: [:id, :nome, :descricao, :url, :principal, :_destroy],
        historias_attributes: [:id, :data, :titulo, :descricao, :_destroy]
    
    filter :nome
    
    form do |f|
        f.inputs do
            f.input :nome
            f.input :telefone
            f.input :whatsapp
            f.input :cartao
            f.input :email
            f.input :endereco
            f.inputs do
              f.has_many :fotos, allow_destroy: true, new_record: true do |a|
                a.input :url
                a.input :principal
                a.input :nome
                a.input :descricao, as: :text
              end
            end
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
        column :foto do |obj|
           image_tag obj.foto_principal_url, size: "50x50"
        end
        column :nome
        column :telefone
        column :whatsapp
        column :cartao
        column :email
        column :endereco
        
        actions
    end

    show title: proc{|p| "Produtor: " + p.nome }do
        attributes_table do 
            row :nome
            row :telefone
            row :whatsapp
            row :cartao
            row :email
            row :endereco
            row :created_at
            row :updated_at
        end
        panel "Produtos" do
            table_for produtor.produtos do
                column  :foto do |obj|
                    image_tag obj.foto_principal_url, size: "50x50"
                end
                column  :nome
                column  :producao
                column  :preco
                column "" do |obj|
                    span link_to "Visualizar", admin_produto_path(obj)
                    span link_to "Editar", edit_admin_produto_path(obj)
                end
            end
        end
        panel "Fotos" do
            table_for produtor.fotos do
                column  :foto do |obj|
                    image_tag obj.url, size: "50x50"
                end
                column  :nome
                column  :descricao
                column  :principal
            end
        end
        panel "Vídeo" do
            table_for produtor.video do
                column  :codigo do |obj|
                   obj ? link_to("Assista" , "https://www.youtube.com/watch?v=#{obj.codigo}", target: "_blank") : ""
                end
                column  :nome
                column  :descricao
            end
        end
        panel "História" do
            table_for produtor.historias do
                column  :data
                column  :titulo
                column  :descricao
            end
        end
    end
end
