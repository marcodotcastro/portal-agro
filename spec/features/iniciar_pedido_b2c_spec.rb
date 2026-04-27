require "rails_helper"

feature "Iniciar pedido B2C a partir da pagina de produto", :type => :feature do
  def criar_produto_para_pedido
    produtor = create(:produtor)
    create(:produto, produtor: produtor, nome: "Produto Pedido B2C")
  end

  def abrir_formulario_pedido(produto)
    visit estado_cidade_produtor_produto_path(
      produto.produtor.cidade.estado,
      produto.produtor.cidade,
      produto.produtor,
      produto
    )

    click_link "Fazer Pedido"
  end

  scenario "comprador abre formulario de pedido vinculado ao produto" do
    produto = criar_produto_para_pedido

    abrir_formulario_pedido(produto)

    expect(page).to have_current_path(new_pedido_path(produto_id: produto))
    expect(page).to have_text("Pedido para #{produto.nome}")
    expect(page).to have_field("Nome", type: "text")
    expect(page).to have_field("Contato", type: "text")
    expect(page).to have_field("Quantidade", type: "number")
  end

  scenario "comprador submete dados iniciais sem quebrar o fluxo" do
    produto = criar_produto_para_pedido

    abrir_formulario_pedido(produto)

    fill_in "Nome", with: "Maria"
    fill_in "Contato", with: "61999990000"
    fill_in "Quantidade", with: "2"
    fill_in "Observações", with: "Entrega no fim da tarde"

    expect do
      click_button "Enviar pedido"
    end.to change(Pedido, :count).by(1)

    pedido = Pedido.order(:created_at).last

    expect(page).to have_current_path(new_pedido_path, ignore_query: true)
    expect(page).to have_text("Pedido enviado com sucesso.")
    expect(page).to have_text("Pedido para #{produto.nome}")
    expect(pedido.produto_id).to eq(produto.id)
    expect(pedido.nome).to eq("Maria")
    expect(pedido.contato).to eq("61999990000")
    expect(pedido.quantidade).to eq(2)
    expect(pedido.observacoes).to eq("Entrega no fim da tarde")
    expect(pedido.status).to eq("novo")
    expect(pedido.created_at).to be_present
  end

  scenario "comprador nao envia pedido invalido e ve erros por campo" do
    produto = criar_produto_para_pedido

    abrir_formulario_pedido(produto)

    fill_in "Contato", with: "61999990000"

    expect do
      click_button "Enviar pedido"
    end.not_to change(Pedido, :count)

    expect(page).to have_current_path(pedidos_path, ignore_query: true)
    expect(page).to have_text("Revise os campos destacados.")
    expect(page).to have_css("#pedido_nome.is-invalid")
    expect(page).to have_css("#pedido_quantidade.is-invalid")
  end

  scenario "acesso direto sem produto_id redireciona sem erro" do
    visit new_pedido_path

    expect(page).to have_current_path(produtos_path, ignore_query: true)
  end
end
