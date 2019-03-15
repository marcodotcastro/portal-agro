ActiveAdmin.register_page "Producao" do
  menu parent: "Relatorios"
  breadcrumb do
    ['admin', 'relatorios', 'producoes']
  end


  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Produção"
      end
    end
    columns do
      column do
        # TODO: Relatório fake, só para uso comercial
        panel "Por Mês no Ano" do
          render partial: 'dashboards/producao/por_mes_no_ano'
        end
      end
    end

  end
end
