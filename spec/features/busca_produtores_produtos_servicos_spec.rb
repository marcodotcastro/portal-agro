require "rails_helper"

feature "Busca por nome em produtores, produtos e serviços", type: :feature do
  let!(:produtor_publicado) { create(:produtor, nome: "Maria", published_at: Date.current) }
  let!(:produto_publicado) { create(:produto, nome: "Queijo Fresco", produtor: produtor_publicado, published_at: Date.current) }
  let!(:servico_publicado) { create(:servico, nome: "Poda Rural", produtor: produtor_publicado, published_at: Date.current) }

  scenario "produtores mantém termo e exibe aviso quando não há resultados" do
    termo = "Produtor Inexistente"

    visit produtores_path
    expect(page).to have_css("form[action='#{produtores_path}']")
    expect(page).to have_link("Cancelar", href: "#{produtores_path}?scroll_to_filters=1")
    fill_in "q_nome_cont", with: termo
    click_button "Pesquisar"

    expect(page).to have_field("q_nome_cont", with: termo)
    expect(page).to have_text("Nenhum produtor encontrado para os filtros informados.")
  end

  scenario "produtos mantém termo e exibe aviso quando não há resultados" do
    termo = "Produto Inexistente"

    visit produtos_path
    expect(page).to have_css("form[action='#{produtos_path}']")
    expect(page).to have_link("Cancelar", href: "#{produtos_path}?scroll_to_filters=1")
    fill_in "q_nome_cont", with: termo
    click_button "Pesquisar"

    expect(page).to have_field("q_nome_cont", with: termo)
    expect(page).to have_text("Nenhum produto encontrado para os filtros informados.")
  end

  scenario "serviços mantém termo e exibe aviso quando não há resultados" do
    termo = "Serviço Inexistente"

    visit servicos_path
    expect(page).to have_css("form[action='#{servicos_path}']")
    expect(page).to have_link("Cancelar", href: "#{servicos_path}?scroll_to_filters=1")
    fill_in "q_nome_cont", with: termo
    click_button "Pesquisar"

    expect(page).to have_field("q_nome_cont", with: termo)
    expect(page).to have_text("Nenhum serviço encontrado para os filtros informados.")
  end
end
