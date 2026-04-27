require "rails_helper"

feature "Iniciar pedido B2C a partir da pagina de produto", :type => :feature do
  def criar_produto_para_pedido
    produtor = create(:produtor)
    create(:produto, produtor: produtor, nome: "Produto Pedido B2C")
  end

  scenario "comprador abre formulario de pedido vinculado ao produto" do
    produto = criar_produto_para_pedido

    visit estado_cidade_produtor_produto_path(
      produto.produtor.cidade.estado,
      produto.produtor.cidade,
      produto.produtor,
      produto
    )

    click_link "Fazer Pedido"

    expect(page).to have_current_path(new_pedido_path(produto_id: produto))
    expect(page).to have_text("Pedido para #{produto.nome}")
    expect(page).to have_field("Nome", type: "text")
    expect(page).to have_field("Contato", type: "text")
    expect(page).to have_field("Quantidade", type: "number")
  end

  scenario "comprador submete dados iniciais sem quebrar o fluxo" do
    produto = criar_produto_para_pedido

    visit estado_cidade_produtor_produto_path(
      produto.produtor.cidade.estado,
      produto.produtor.cidade,
      produto.produtor,
      produto
    )

    click_link "Fazer Pedido"

    fill_in "Nome", with: "Maria"
    fill_in "Contato", with: "61999990000"
    fill_in "Quantidade", with: "2"
    fill_in "Observações", with: "Entrega no fim da tarde"

    click_button "Continuar"

    expect(page).to have_current_path(pedidos_path, ignore_query: true)
    expect(page).to have_text("Recebemos os dados iniciais do seu pedido.")
    expect(page).to have_text("Pedido para #{produto.nome}")
  end

  scenario "acesso direto sem produto_id redireciona sem erro" do
    visit new_pedido_path

    expect(page).to have_current_path(produtos_path, ignore_query: true)
  end
end
