# Story 1.3: Listar Pedidos no Painel do Produtor

Status: review

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a produtor,
I want visualizar os pedidos recebidos em uma lista ordenada,
so that eu consiga priorizar atendimento comercial rapidamente.

## Acceptance Criteria

1. Given que existem pedidos cadastrados, When acesso o painel de pedidos, Then vejo a lista ordenada do mais recente para o mais antigo, And cada item mostra dados minimos (comprador, produto, quantidade, status, data/hora).
2. Given que um novo pedido foi criado, When atualizo o painel, Then o pedido aparece na listagem em ate 5 segundos, And ele respeita a ordenacao por recencia.

## Tasks / Subtasks

- [x] Implementar painel de pedidos para produtor (AC: 1)
- [x] Expor rota de listagem de pedidos (`pedidos#index`)
- [x] Renderizar lista ordenada por `created_at desc`
- [x] Exibir dados minimos por item: comprador, produto, quantidade, status e data/hora
- [x] Garantir exibicao de novos pedidos apos atualizacao do painel (AC: 2)
- [x] Cobrir comportamento com testes automatizados (AC: 1, 2)

## Dev Notes

- Manter stack atual Rails + ERB + Bootstrap.
- Nao incluir alteracao de status nesta story (isso pertence a Story 1.4).
- Reusar o dominio `Pedido` introduzido na Story 1.2.

### References

- Requisitos: `_bmad-output/planning-artifacts/epics.md` (Story 1.3)
- Contexto de negocio: `_bmad-output/planning-artifacts/prd.md`
- Base implementada na Story 1.2: `_bmad-output/implementation-artifacts/1-2-enviar-pedido-com-validacao-e-persistencia.md`

## Dev Agent Record

### Agent Model Used

GPT-5 Codex

### Debug Log References

- `rtk bundle exec rspec spec/features/painel_pedidos_produtor_spec.rb` (2 examples, 0 failures)
- `rtk bundle exec rspec` (suite completa: 21 examples, 0 failures)

### Completion Notes List

- Adicionada rota `GET /pedidos` para painel do produtor.
- Implementado `PedidosController#index` com ordenacao por recencia (`created_at DESC`).
- Criada tela `app/views/pedidos/index.html.erb` com listagem dos dados minimos: comprador, produto, quantidade, status e data/hora.
- Refinada UI do painel com layout em cards, cabecalho destacado, metricas de acompanhamento e empty state.
- Extraido mapeamento de status para helper (`PedidosHelper`) e internacionalizacao pt-BR em `activerecord.pt-BR.yml`.
- Coberto comportamento de ordenacao e de atualizacao de painel com spec de feature dedicada.
- Validado sem regressao na suite completa.

### File List

- _bmad-output/implementation-artifacts/1-3-listar-pedidos-no-painel-do-produtor.md
- config/routes.rb
- app/controllers/pedidos_controller.rb
- app/views/pedidos/index.html.erb
- app/helpers/pedidos_helper.rb
- app/assets/stylesheets/pedidos.css
- config/locales/activerecord.pt-BR.yml
- spec/factories/pedidos.rb
- spec/features/painel_pedidos_produtor_spec.rb
- _bmad-output/implementation-artifacts/sprint-status.yaml

## Change Log

- 2026-04-27: Story 1.3 iniciada.
- 2026-04-27: Story 1.3 implementada e atualizada para `review`.
- 2026-04-27: Ajuste de UI do painel aplicado com status traduzido e specs novamente validados.
