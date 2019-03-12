ActiveAdmin.register Categoria do
  menu priority: 3

  permit_params :nome, :descricao

  filter :nome

  form do |f|
    f.inputs do
      f.input :nome
      f.input :descricao, as: :text

      actions
    end
  end

  index do
    selectable_column
    column :nome
    column :descricao

    actions
  end


end
