ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Bem Vindo ao Portal Agro de Corumbá de Goiás"
      end
    end

    columns do
       column do
         panel "Recentes Produtos Cadastrados" do
           ul do
             Produto.last(5).map do |obj|
               li link_to("#{obj.nome}", admin_produto_path(obj)) + ", #{obj.producao}, #{obj.preco}, #{obj.produtor.nome}"
             end
           end
         end
       end
      column do
        panel "Números" do
           ul do
               li "Produtos #{Produto.count}"
               li "Produtores #{Produtor.count}"
           end
        end
      end
    end
  end 
end
