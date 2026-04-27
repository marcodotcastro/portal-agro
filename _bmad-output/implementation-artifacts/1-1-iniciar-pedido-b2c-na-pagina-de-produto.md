# Story 1.1: Iniciar Pedido B2C na Pagina de Produto

Status: ready-for-dev

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a comprador final,
I want iniciar um pedido direto na pagina de produto,
so that eu nao precise abrir WhatsApp para comecar a compra.

## Acceptance Criteria

1. Given que estou na pagina de um produto publicado, When clico em "Fazer Pedido", Then o sistema abre o formulario de pedido ja vinculado ao produto.
2. Given que estou no fluxo de iniciar pedido, Then o layout do formulario funciona em mobile sem quebra visual.

## Tasks / Subtasks

- [ ] Adicionar entrada de navegacao para iniciar pedido no detalhe do produto (AC: 1)
- [ ] Atualizar `app/views/produtos/show.html.erb` com CTA visivel "Fazer Pedido" proximo das informacoes comerciais
- [ ] Garantir que o CTA carregue o contexto do produto atual (id/slug) para o formulario
- [ ] Criar rota e endpoint para tela de inicio do pedido (AC: 1)
- [ ] Definir rota REST para `pedidos#new` sem quebrar as rotas atuais de `produtos#show`
- [ ] Criar `PedidosController#new` para carregar o produto alvo e montar o formulario inicial
- [ ] Criar tela de formulario inicial de pedido vinculada ao produto (AC: 1, 2)
- [ ] Implementar `app/views/pedidos/new.html.erb` exibindo nome do produto selecionado e campos base do pedido
- [ ] Usar estrutura Bootstrap responsiva (grid simples, `col-12`, espacamentos ja usados no projeto)
- [ ] Nao implementar persistencia nesta story; somente abertura do formulario com contexto correto (fronteira com Story 1.2)
- [ ] Cobrir comportamento principal com testes automatizados (AC: 1, 2)
- [ ] Criar spec de feature para validar fluxo: abrir pagina de produto -> clicar em "Fazer Pedido" -> ver formulario com produto correto
- [ ] Validar que a pagina renderiza elementos responsivos basicos sem regressao de navegacao

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

- Sem execucao de app/testes nesta etapa; artefato de planejamento somente.

### Completion Notes List

- Ultimate context engine analysis completed - comprehensive developer guide created.
- Story delimitada para iniciar o pedido sem antecipar persistencia da Story 1.2.
- Guardrails adicionados para reutilizar padroes existentes e reduzir risco de regressao.

### File List

- _bmad-output/implementation-artifacts/1-1-iniciar-pedido-b2c-na-pagina-de-produto.md
- _bmad-output/implementation-artifacts/sprint-status.yaml
