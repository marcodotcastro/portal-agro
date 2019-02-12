ActiveAdmin.register Produtor do
    menu priority: 1

    permit_params :nome, :telefone, :email, :endereco, :foto, :whatsapp, :cartao,
        videos_attributes: [:id, :nome, :descricao, :codigo, :_destroy]
    
    filter :nome
    
    index do
        selectable_column
        column :foto do |obj|
            image_tag obj.foto, size: "50x50"
        end
        column :nome
        column :telefone
        column :whatsapp
        column :cartao
        column :email
        column :endereco
        
        actions
    end

    form do |f|
        f.inputs do
            f.input :nome
            f.input :telefone
            f.input :whatsapp
            f.input :cartao
            f.input :email
            f.input :endereco
            f.input :foto
            f.inputs do
              f.has_many :videos, allow_destroy: true, new_record: true do |a|
                a.input :nome
                a.input :descricao
                a.input :codigo
              end
            end
           f.actions
        end
    end
  
    show title: proc{|p| "Produtor: " + p.nome }do
        attributes_table do 
            row :foto do |obj|
                image_tag obj.foto, size: "300x200"
            end
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
                column  :nome
                column  :producao
                column  :preco
                column "" do |obj|
                    span link_to "Visualizar", admin_produto_path(obj)
                    span link_to "Editar", edit_admin_produto_path(obj)
                end
            end
        end
        panel "Vídeos" do
            table_for produtor.videos do
                column  :nome
                column  :descricao
                column :codigo do |obj|
                    link_to "Assista" , "https://www.youtube.com/watch?v=#{obj.codigo}", target: "_blank"
                end
            end
        end
    end
end
