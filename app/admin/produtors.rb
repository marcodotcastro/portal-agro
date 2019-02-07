ActiveAdmin.register Produtor do
menu priority: 1

permit_params :nome, :telefone, :email, :endereco, :video, :foto

end
