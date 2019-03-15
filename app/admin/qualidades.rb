ActiveAdmin.register Qualidade do
  menu parent: "Configurações"
  breadcrumb do
    ['admin', 'configurações', 'qualidade']
  end

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
