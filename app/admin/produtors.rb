ActiveAdmin.register Produtor do
    menu priority: 1

    permit_params :nome, :telefone, :email, :endereco, :video, :foto, :whatsapp, :cartao
    
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
        column :video do |obj|
            link_to "Assista" , "https://www.youtube.com/watch?v=#{obj.video}", target: "_blank"
        end
        
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
          f.input :video
          f.input :foto
          actions
        end
    end
  
    show do
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
            row :video
            row :created_at
            row :updated_at
        end
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

end
