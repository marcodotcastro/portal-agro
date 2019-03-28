require "rails_helper"

def expect_produtor
  expect(page).to have_text("O Produtor")
  expect(page).to have_text("José Silva (Zé)")
  expect(page).to have_text("A História")
end

feature "Acesso à Página Principal e Clicar no Produtor, Produto e Serviço", :type => :feature do

  before :all do
    @produtor = create(:produtor, :com_produtos, :com_servicos)
  end

  scenario "produtos" do
    visit root_path

    click_link('Leite 1')

    expect(page).to have_text("leite é bom...")
    expect(page).to have_text("A Criação")
    expect(page).to have_text("As Fotos")
    expect_produtor

  end


  scenario "serviços" do
    visit root_path

    click_link('Roçar 1')

    expect(page).to have_text("R$ 20,00 por dia")
    expect(page).to have_text("As Fotos")

    expect_produtor
  end


  scenario "produtores" do
    visit root_path

    click_link('José Silva')

    expect_produtor

    expect(page).to have_text("As Fotos")
    expect(page).to have_text("Os Produtos")
    expect(page).to have_text("Os Serviços")
  end

end
