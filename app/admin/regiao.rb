ActiveAdmin.register_page "Regiao" do
  menu parent: "Relatorios"
  breadcrumb do
    ['admin', 'relatorios', 'regioes']
  end


  content title: proc {I18n.t("active_admin.dashboard")} do

    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Região"
      end
    end

    columns do
      #TODO: Relatório fake, só para uso comercial
      column do
        panel "Estados" do
          render partial: 'dashboards/regiao/goias'
        end
      end
    end

    columns do
      column do
        panel "Produtores do Goiás por Cidade" do
          Cidade.all.map do |c|
            ul do
              li "Em #{c.nome} tem #{c.produtores.count} produtores cadastrados:" do
                ul do
                  c.produtores.map do |p|
                    unless p.produtos.empty?
                      li "#{p.nome} tem #{p.produtos.count} produtos cadastrados"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

  end
end
