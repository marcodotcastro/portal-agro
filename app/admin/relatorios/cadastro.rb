ActiveAdmin.register_page "Cadastro" do
  menu parent: "Relatórios"
  breadcrumb do
    ['admin', 'relatórios', 'cadastros']
  end


  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Cadastros"
      end
    end
    columns do
      column do
        panel "Produtores por Mês" do
          render partial: 'dashboards/cadastro/produtor_por_mes'
        end
      end
    end
    columns do
      column do
        panel "Produtos por Mês" do
          render partial: 'dashboards/cadastro/produto_por_mes'
        end
      end
    end
    columns do
      column do
        panel "Serviços por Mês" do
          render partial: 'dashboards/cadastro/servico_por_mes'
        end
      end

    end

  end
end
