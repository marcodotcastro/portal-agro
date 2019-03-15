ActiveAdmin.register_page "Quantidade" do
  menu parent: "Relatórios"
  breadcrumb do
    ['admin', 'relatórios', 'quantidades']
  end


  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Quantidades"
      end
    end
    columns do
      column do
        panel "Quantidade de Produtos por Categoria" do
          render partial: 'dashboards/quantidade/produto_por_categoria'
        end
      end
      column do
        panel "Quantidade de Produtos por Qualidade" do
          render partial: 'dashboards/quantidade/produto_por_qualidade'
        end
      end
    end

  end
end
