# Story 1.2: Enviar Pedido com Validacao e Persistencia

Status: review

<!-- Note: Validation is optional. Run validate-create-story for quality check before dev-story. -->

## Story

As a comprador final,
I want enviar um pedido com dados minimos obrigatorios,
so that o produtor receba uma solicitacao completa para contato.

## Acceptance Criteria

1. Given que preenchi o formulario de pedido, When envio com campos obrigatorios validos, Then o sistema cria o pedido com status inicial `novo` e registra data/hora, And exibe confirmacao de envio ao comprador.
2. Given que ha campos obrigatorios invalidos ou vazios, When tento enviar, Then o sistema bloqueia envio e mostra erros por campo, And o pedido nao e criado.

## Tasks / Subtasks

- [x] Criar persistencia de pedido (AC: 1)
- [x] Definir estrutura de dados para pedido com produto, dados do comprador, quantidade, observacoes e timestamps
- [x] Garantir status inicial `novo` na criacao
- [x] Implementar validacoes de obrigatoriedade por campo (AC: 2)
- [x] Bloquear criacao quando campos obrigatorios estiverem invalidos ou vazios
- [x] Exibir mensagens de erro por campo no formulario
- [x] Implementar fluxo de sucesso no envio (AC: 1)
- [x] Exibir confirmacao de envio apos criacao bem-sucedida
- [x] Cobrir comportamento com testes automatizados (AC: 1, 2)
- [x] Criar testes para envio valido (pedido criado com status e timestamp)
- [x] Criar testes para envio invalido (pedido nao criado e erros exibidos)

## Dev Notes

- Manter estilo Rails + ERB + Bootstrap, sem introduzir nova biblioteca.
- Reaproveitar o formulario de `pedidos/new` ja entregue na Story 1.1.
- Manter a fronteira desta story: nao inclui listagem de pedidos no painel do produtor (Story 1.3).
- Manter rotas e comportamento amigavel com FriendlyId para produto.

### References

- Requisitos: `_bmad-output/planning-artifacts/epics.md` (Story 1.2)
- Contexto de negocio: `_bmad-output/planning-artifacts/prd.md`
- Base implementada na Story 1.1: `_bmad-output/implementation-artifacts/1-1-iniciar-pedido-b2c-na-pagina-de-produto.md`

## Dev Agent Record

### Agent Model Used

GPT-5 Codex

### Debug Log References

- `rtk bundle exec rspec spec/features/iniciar_pedido_b2c_spec.rb` (vermelho inicial com `uninitialized constant Pedido`)
- `rtk bin/rails db:migrate` (criacao da tabela `pedidos`)
- `rtk bundle exec rspec spec/features/iniciar_pedido_b2c_spec.rb` (verde final: 4 examples, 0 failures)
- `rtk bundle exec rspec` (suite completa verde: 19 examples, 0 failures)

### Completion Notes List

- Implementado `Pedido` com persistencia em banco, associacao com `Produto` e status inicial `novo`.
- Adicionada migration para tabela `pedidos` com campos de comprador, quantidade, observacoes e status.
- `PedidosController#create` agora persiste com sucesso e redireciona com confirmacao ao comprador.
- Fluxo invalido bloqueia criacao, mantem o formulario e exibe erros por campo com destaque visual.
- Feature spec cobre cenario valido (cria pedido com timestamp/status) e invalido (nao cria pedido).
- Validado sem regressao na suite completa.

### File List

- _bmad-output/implementation-artifacts/1-2-enviar-pedido-com-validacao-e-persistencia.md
- app/models/pedido.rb
- db/migrate/20260427212500_create_pedidos.rb
- db/schema.rb
- app/controllers/pedidos_controller.rb
- app/views/pedidos/new.html.erb
- spec/features/iniciar_pedido_b2c_spec.rb
- _bmad-output/implementation-artifacts/sprint-status.yaml

## Change Log

- 2026-04-27: Story 1.2 iniciada.
- 2026-04-27: Story 1.2 implementada com persistencia, validacoes e testes; status atualizado para `review`.
