ActiveAdmin.register Categoria do
    menu priority: 3
    
    permit_params :nome, :descricao

    filter :nome
    
    index do
        selectable_column
        column :nome
        column :descricao
        actions
    end

    form do |f|
        f.inputs do
          f.input :nome
          f.input :descricao, as: :text
          actions
        end
    end

end
