ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Bem Vindo ao Portal Agro de Corumbá de Goiás"
      end
    end

    columns do
      column do
        panel "Quantidade de Cadastros" do
          ul do
            li "Produto(s): #{Produto.count} cadastrado(s)"
            li "Produtor(es): #{Produtor.count} cadastrado(s)"
            li "Administrador(es): #{AdminUser.count} cadastrado(s)"
          end
        end
      end
      column do
        panel "Quantidade de Produtos por Categoria" do
          ul do
            li "Animal: #{Categoria.find(1).produtos.count} cadastrado(s)"
            li "Vegetal: #{Categoria.find(2).produtos.count} cadastrado(s)"
            li "Insdutrial: #{Categoria.find(3).produtos.count} cadastrado(s)"
          end
        end
      end
      column do
        panel "Quantidade de Produtos por Qualidade" do
          ul do
            li "Tradicional: #{Qualidade.find(1).produtos.count} cadastrado(s)"
            li "Natural: #{Qualidade.find(2).produtos.count} cadastrado(s)"
            li "Orgânico: #{Qualidade.find(3).produtos.count} cadastrado(s)"
          end
        end
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
              li link_to("#{obj.nome}", admin_produto_path(obj)) + " é vendido por #{obj.preco} e é produzido pelo produtor " + link_to("#{obj.produtor.nome}", admin_produtor_path(obj.produtor))
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
              li link_to("#{obj.produtor.nome}", admin_produtor_path(obj.produtor)) + " atualizou sua produção de " + link_to("#{obj.nome}", admin_produto_path(obj)) + " e ocorreu " + obj.evolucao.to_s
            end
          end
        end
      end
    end

  end
end
