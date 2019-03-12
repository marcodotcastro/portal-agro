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
            li "Administrador(es): #{AdminUser.count} cadastrado(s)"
            li "Estado(s): #{Estado.count} cadastrado(s)"
            li "Cidade(s): #{Cidade.count} cadastrado(s)"
            li "Produtor(es): #{Produtor.count} cadastrado(s)"
            li "Produto(s): #{Produto.count} cadastrado(s)"
          end
        end
      end
      column do
        panel "Quantidade de Produtos por Categoria" do
          ul do
            Categoria.all.map do |c|
              li "#{c.nome}: #{c.produtos.count} cadastrado(s)"
            end
          end
        end
      end
      column do
        panel "Quantidade de Produtos por Qualidade" do
          ul do
            Qualidade.all.map do |q|
              li "#{q.nome}: #{q.produtos.count} cadastrado(s)"
            end
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
              li link_to("#{obj.produtor.nome_completo} (#{obj.produtor.apelido})", admin_produtor_path(obj.produtor)) + " vende " + link_to("#{obj.nome}", admin_produto_path(obj)) + " por #{obj.preco} "
            end
          end
        end
      end
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

    columns do
      column do
        panel "Produtores por Cidade" do
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
