ActiveAdmin.register Estado do
  menu priority: 4

  permit_params :nome

  filter :nome

  form do |f|
    f.inputs do
      f.input :nome

      actions
    end
  end

  index do
    selectable_column
    column :nome

    actions
  end

  show title: proc {|p| "Estado: " + p.nome} do
    attributes_table do
      row :nome
    end
  end

end