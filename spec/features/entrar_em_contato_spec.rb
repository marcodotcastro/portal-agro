require "rails_helper"

feature "Entrar em Contato", :type => :feature do

  scenario "entrar em contato com todos os dados" do
    visit new_contato_path

    fill_in "Nome", :with => "Marco"
    fill_in "Telefone", :with => "61988776655"
    fill_in "Email", :with => "email@gmail.com"
    fill_in "Descrição", :with => "Oi, preciso de ajuda"

    click_button "Enviar"


    expect(page).to have_text("Obrigado pela Visita!")
    expect(page).to have_text("Já recebemos seu contato.")
    expect(page).to have_text("O mais breve possível responderemos.")
    expect(page).to have_text("Os Agricultores Familiares Agradecem.")
  end

  scenario "entrar em contato sem todos os dados" do
    visit new_contato_path

    fill_in "Descrição", :with => "Oi, preciso de ajuda"

    click_button "Enviar"

    expect(page).to have_text("Nome não pode ficar em branco")
    expect(page).to have_text("Telefone não pode ficar em branco")
    expect(page).to have_text("Email não pode ficar em branco")
  end

end
