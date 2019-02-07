ActiveAdmin.register Produto do
menu priority: 2

permit_params :nome, :descricao, :producao, :preco, :video, :foto, :produtor_id

form do |f|
  f.inputs do
    f.input :produtor_id, :label => 'Produtor', :as => :select, :collection => Produtor.all.map{|u| ["#{u.nome}", u.id]}
    f.input :nome
    f.input :descricao
    f.input :producao
    f.input :preco
    f.input :video
    f.input :foto
    actions
  end
end

end
