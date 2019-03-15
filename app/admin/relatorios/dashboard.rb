ActiveAdmin.register_page "Dashboard" do
  breadcrumb do
    ['admin', 'dashboard']
  end

  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Bem Vindo ao Portal Agro"
      end
    end

    columns do
      column do
        panel "Recentes Produtores" do
          ul do
            Produtor.last(5).map do |obj|
              li link_to("#{obj.nome}", admin_produtor_path(obj)) + " é nosso novo produdor"
            end
          end
        end
      end
      column do
        panel "Recentes Produtos" do
          ul do
            Produto.last(5).map do |obj|
              li link_to("#{obj.produtor.nome_completo} (#{obj.produtor.apelido})", admin_produtor_path(obj.produtor)) + " vende " + link_to("#{obj.nome}", admin_produto_path(obj)) + " por #{obj.preco} "
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recentes Produções" do
          ul do
            Produto.last(5).map do |obj|
              li link_to("#{obj.produtor.nome}", admin_produtor_path(obj.produtor)) + " teve " + obj.evolucao.to_s + " na produção de " + link_to("#{obj.nome}", admin_produto_path(obj))
            end
          end
        end
      end
    end



  end
end
