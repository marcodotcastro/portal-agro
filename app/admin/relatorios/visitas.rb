ActiveAdmin.register_page "Visitas" do
  menu parent: "Relatórios"
  breadcrumb do
    ['admin', 'relatórios', 'visitas']
  end


  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Visitas"
      end
    end
    columns do
      column do
        panel "Visitas Produtores" do
          ul do
            Produtor.last(5).map do |produtor|
              li link_to("#{produtor.nome}", admin_produtor_path(produtor)) + " tem " + visitas_ao_produtor(produtor).to_s
            end
          end
        end
      end
      column do
        panel "Visitas Produtos" do
          ul do
            Produto.last(5).map do |produto|
              li link_to("#{produto.nome}", admin_produto_path(produto)) + " tem " + visitas_ao_produto(produto).to_s
            end
          end
        end
      end
      column do
        panel "Visitas Serviços" do
          ul do
            Servico.last(5).map do |servico|
              li link_to("#{servico.nome}", admin_servico_path(servico)) + " tem " + visitas_ao_servico(servico).to_s
            end
          end
        end
      end
    end

  end
end
