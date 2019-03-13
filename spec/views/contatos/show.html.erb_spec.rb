require 'rails_helper'

RSpec.describe "contatos/show", type: :view do
  before(:each) do
    @contato = assign(:contato, Contato.create!(
      :nome => "Nome",
      :telefone => "Telefone",
      :email => "Email",
      :descricao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Telefone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
