require "rails_helper"

feature "Painel de pedidos do produtor", :type => :feature do
  def criar_produto_publicado_para_pedidos
    produtor = create(:produtor, nome: "Produtor Painel", published_at: Date.current)
    create(:produto, produtor: produtor, nome: "Produto Painel", published_at: Date.current)
  end

  def criar_pedido(produto:, nome:, created_at:, status:, quantidade:)
    pedido = create(
      :pedido,
      produto: produto,
      nome: nome,
      contato: "61999990000",
      quantidade: quantidade,
      status: status
    )
    pedido.update_columns(created_at: created_at, updated_at: created_at)
    pedido
  end

  scenario "produtor visualiza pedidos ordenados por recencia com dados minimos" do
    produto = criar_produto_publicado_para_pedidos
    pedido_antigo = criar_pedido(
      produto: produto,
      nome: "Ana Compradora",
      created_at: 2.hours.ago,
      status: :em_contato,
      quantidade: 2
    )
    pedido_recente = criar_pedido(
      produto: produto,
      nome: "Carlos Comprador",
      created_at: 5.minutes.ago,
      status: :novo,
      quantidade: 5
    )

    visit pedidos_path

    expect(page).to have_text("Painel de Pedidos")
    expect(page).to have_text("Carlos Comprador")
    expect(page).to have_text("Ana Compradora")
    expect(page).to have_text(produto.nome)
    expect(page).to have_text("5")
    expect(page).to have_text("2")
    expect(page).to have_text("Novo")
    expect(page).to have_text("Em contato")
    expect(page).to have_text(pedido_recente.created_at.strftime("%d/%m/%Y %H:%M"))
    expect(page).to have_text(pedido_antigo.created_at.strftime("%d/%m/%Y %H:%M"))
    expect(page.body.index("Carlos Comprador")).to be < page.body.index("Ana Compradora")
  end

  scenario "novo pedido aparece no painel ao atualizar mantendo ordenacao" do
    produto = criar_produto_publicado_para_pedidos
    criar_pedido(
      produto: produto,
      nome: "Pedido Antigo",
      created_at: 1.hour.ago,
      status: :novo,
      quantidade: 1
    )

    visit pedidos_path
    expect(page).to have_text("Pedido Antigo")

    criar_pedido(
      produto: produto,
      nome: "Pedido Novo",
      created_at: Time.current,
      status: :novo,
      quantidade: 3
    )

    visit current_path

    expect(page).to have_text("Pedido Novo")
    expect(page.body.index("Pedido Novo")).to be < page.body.index("Pedido Antigo")
  end
end
