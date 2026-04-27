# Story 1.1: Iniciar Pedido B2C na Pagina de Produto

Status: done

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a comprador final,
I want iniciar um pedido direto na pagina de produto,
so that eu nao precise abrir WhatsApp para comecar a compra.

## Acceptance Criteria

1. Given que estou na pagina de um produto publicado, When clico em "Fazer Pedido", Then o sistema abre o formulario de pedido ja vinculado ao produto.
2. Given que estou no fluxo de iniciar pedido, Then o layout do formulario funciona em mobile sem quebra visual.

## Tasks / Subtasks

- [x] Adicionar entrada de navegacao para iniciar pedido no detalhe do produto (AC: 1)
- [x] Atualizar `app/views/produtos/show.html.erb` com CTA visivel "Fazer Pedido" proximo das informacoes comerciais
- [x] Garantir que o CTA carregue o contexto do produto atual (id/slug) para o formulario
- [x] Criar rota e endpoint para tela de inicio do pedido (AC: 1)
- [x] Definir rota REST para `pedidos#new` sem quebrar as rotas atuais de `produtos#show`
- [x] Criar `PedidosController#new` para carregar o produto alvo e montar o formulario inicial
- [x] Criar tela de formulario inicial de pedido vinculada ao produto (AC: 1, 2)
- [x] Implementar `app/views/pedidos/new.html.erb` exibindo nome do produto selecionado e campos base do pedido
- [x] Usar estrutura Bootstrap responsiva (grid simples, `col-12`, espacamentos ja usados no projeto)
- [x] Nao implementar persistencia nesta story; somente abertura do formulario com contexto correto (fronteira com Story 1.2)
- [x] Cobrir comportamento principal com testes automatizados (AC: 1, 2)
- [x] Criar spec de feature para validar fluxo: abrir pagina de produto -> clicar em "Fazer Pedido" -> ver formulario com produto correto
- [x] Validar que a pagina renderiza elementos responsivos basicos sem regressao de navegacao

### Review Findings

- [x] [Review][Patch] Formulario de pedido envia dados pessoais via query string por usar `GET` no submit [app/views/pedidos/new.html.erb:12]
- [x] [Review][Patch] Acesso direto a `/pedidos/new` sem `produto_id` nao possui tratamento explicito e depende de excecao [app/controllers/pedidos_controller.rb:10]
- [x] [Review][Patch] Cobertura de teste valida apenas caminho feliz e nao cobre ausencia/invalidade de `produto_id` [spec/features/iniciar_pedido_b2c_spec.rb:4]

## Dev Notes

- O projeto usa Rails + ERB server-rendered com Bootstrap; manter o padrao existente em views (`app/views/produtos/*.erb`).
- A pagina de produto atual fica em `ProdutosController#show` e view `app/views/produtos/show.html.erb`; este e o ponto de entrada do CTA.
- O contexto do produto e carregado por FriendlyId (`Produto.friendly.find(params[:id])`), entao o fluxo de pedido deve respeitar slug/id atuais.
- Evitar reinventar fluxo de formulario: reaproveitar padrao de `ContatosController#new/create` e `app/views/contatos/new.html.erb` para estrutura `simple_form`.
- Esta story nao deve incluir criacao de tabela/modelo final de pedidos nem submit persistente; isso pertence a Story 1.2 (validacao + persistencia).
- Priorizar baixo impacto: adicionar novos arquivos para `pedidos` e mudanca pontual na view de produto, sem refatoracao ampla.
- Nao ha `architecture.md`/`ux.md` no projeto neste momento; manter stack atual sem introduzir nova biblioteca para este passo.

### Project Structure Notes

- Estrutura alvo:
- `config/routes.rb` (nova rota para iniciar pedido)
- `app/controllers/pedidos_controller.rb` (novo controller com `new`)
- `app/views/pedidos/new.html.erb` (novo formulario inicial)
- `app/views/produtos/show.html.erb` (incluir CTA "Fazer Pedido")
- `spec/features/iniciar_pedido_b2c_spec.rb` (novo fluxo E2E com Capybara)
- `spec/factories/produtos.rb` e `spec/factories/produtores.rb` ja oferecem dados para montar cenario de teste.

### References

- Produto detalhe e contexto atual: `app/controllers/produtos_controller.rb`, `app/views/produtos/show.html.erb`
- Roteamento atual publico: `config/routes.rb`
- Padrao de formulario existente: `app/controllers/contatos_controller.rb`, `app/views/contatos/new.html.erb`
- Modelo de dominio de produto: `app/models/produto.rb`, `db/schema.rb` (`produtos`, `produtores`)
- Requisitos da story: `_bmad-output/planning-artifacts/epics.md` (Story 1.1)
- Objetivo de negocio do MVP B2C: `_bmad-output/planning-artifacts/prd.md` (secoes 1, 3, 5 e 6)

## Dev Agent Record

### Agent Model Used

GPT-5 Codex

### Debug Log References

- `rtk bundle exec rspec spec/features/iniciar_pedido_b2c_spec.rb` (vermelho inicial: link "Fazer Pedido" ausente)
- `rtk bundle exec rspec spec/features/iniciar_pedido_b2c_spec.rb` (verde apos implementacao)
- `rtk bundle exec rspec` (1a execucao: 2 falhas por acoplamento de sequence em specs legadas)
- Ajuste no spec novo para nao consumir sequence global de produtos
- `rtk bundle exec rspec` (2a execucao: 13 exemplos, 0 falhas)
- `rtk bundle exec rspec spec/features/iniciar_pedido_b2c_spec.rb` (review fix: 3 exemplos, 0 falhas)

### Completion Notes List

- Implementado fluxo inicial de pedido B2C com CTA em produto, rota dedicada e formulario vinculado ao produto.
- Mantida fronteira da Story 1.1: sem persistencia de pedido, somente abertura e preenchimento inicial do formulario.
- Adicionado teste de feature para AC principal e ajustado para nao interferir em sequencias de testes existentes.
- Suite completa de regressao executada com sucesso.
- Corrigido submit para `POST /pedidos`, removendo envio de dados em query string.
- Tratado acesso sem `produto_id` com redirecionamento seguro e alerta, evitando `RecordNotFound`.
- Coberto cenario de submit e ausencia de `produto_id` em spec de feature.

### File List

- app/controllers/pedidos_controller.rb
- app/views/pedidos/new.html.erb
- app/views/produtos/show.html.erb
- config/routes.rb
- spec/features/iniciar_pedido_b2c_spec.rb
- _bmad-output/implementation-artifacts/1-1-iniciar-pedido-b2c-na-pagina-de-produto.md
- _bmad-output/implementation-artifacts/sprint-status.yaml

## Change Log

- 2026-04-27: Story 1.1 implementada e validada; status atualizado para `review`.
- 2026-04-27: Findings de review corrigidos; status atualizado para `done`.
