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
            Produtor.last(5).map do |produtor|
              li link_to("#{produtor.nome}", admin_produtor_path(produtor)) + " é nosso novo produdor"
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recentes Produtos" do
          ul do
            Produto.last(5).map do |produto|
              li link_to("#{nome_completo(produto.produtor)} (#{produto.produtor.apelido})", admin_produtor_path(produto.produtor)) + " vende " + link_to("#{produto.nome}", admin_produto_path(produto)) + " por #{produto_preco_completo(produto)} "
            end
          end
        end
      end
      column do
        panel "Recentes Serviços" do
          ul do
            Servico.last(5).map do |servico|
              li link_to("#{nome_completo(servico.produtor)} (#{servico.produtor.apelido})", admin_produtor_path(servico.produtor)) + " vende " + link_to("#{servico.nome}", admin_servico_path(servico)) + " por #{servico_preco_completo(servico)} "
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recentes Produções" do
          ul do
            Produto.last(5).map do |produto|
              li link_to("#{produto.produtor.nome}", admin_produtor_path(produto.produtor)) + " teve " + evolucao(produto) + " na produção de " + link_to("#{produto.nome}", admin_produto_path(produto))
            end
          end
        end
      end
    end


  end
end
