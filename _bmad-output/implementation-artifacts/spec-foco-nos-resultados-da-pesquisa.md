---
title: 'Focar na área de resultados após pesquisa nas listagens públicas'
type: 'bugfix'
created: '2026-04-27'
status: 'in-review'
baseline_commit: 'b43a74c1a1d1afb73fa85c80628238742c8dea11'
context: []
---

<frozen-after-approval reason="human-owned intent — do not modify unless human renegotiates">

## Intent

**Problem:** Após enviar uma pesquisa nas telas de produtores, produtos e serviços, a página recarrega no topo e o usuário perde o contexto da listagem, precisando rolar novamente até os resultados.

**Approach:** Ajustar as buscas para navegar diretamente para a seção de resultados ao submeter os filtros, mantendo o foco visual no conteúdo pesquisado sem alterar regras de consulta.

## Boundaries & Constraints

**Always:** Aplicar comportamento consistente nas três listagens (`produtores`, `produtos`, `servicos`); manter os mesmos filtros, parâmetros e respostas de busca atuais; preservar rotas públicas existentes como `/estados/goias/produtos`.

**Ask First:** Nenhum.

**Never:** Alterar lógica de negócio em controllers/models, scopes de publicação, paginação remota, ou substituir o fluxo de busca por JavaScript customizado quando o ajuste de âncora resolver o foco.

## I/O & Edge-Case Matrix

| Scenario | Input / State | Expected Output / Behavior | Error Handling |
|----------|--------------|---------------------------|----------------|
| Pesquisa com filtros | Usuário preenche filtros e clica em `Pesquisar` | Navegação retorna para a mesma página já posicionada na área de resultados correspondente | N/A |
| Acesso sem pesquisa | Usuário abre listagem sem submeter formulário | Página mantém comportamento atual sem deslocamentos extras automáticos | N/A |

</frozen-after-approval>

## Code Map

- `app/views/produtores/index.html.erb` -- Formulário da listagem de produtores e ponto de ancoragem dos resultados.
- `app/views/produtos/index.html.erb` -- Formulário da listagem de produtos e ponto de ancoragem dos resultados.
- `app/views/servicos/index.html.erb` -- Formulário da listagem de serviços e ponto de ancoragem dos resultados.
- `spec/features/busca_produtores_produtos_servicos_spec.rb` -- Cobertura de regressão para garantir que os formulários enviem com âncora de foco.

## Tasks & Acceptance

**Execution:**
- [x] `app/views/produtores/index.html.erb` -- definir `url` do `search_form_for` com fragmento da área de resultados (`#paginacao_produtores`) -- manter foco no bloco de resultado após pesquisar.
- [x] `app/views/produtos/index.html.erb` -- definir `url` do `search_form_for` com fragmento da área de resultados (`#paginacao_produtos`) -- manter foco no bloco de resultado após pesquisar.
- [x] `app/views/servicos/index.html.erb` -- definir `url` do `search_form_for` com fragmento da área de resultados (`#paginacao_servicos`) -- manter foco no bloco de resultado após pesquisar.
- [x] `spec/features/busca_produtores_produtos_servicos_spec.rb` -- validar ação dos formulários com fragmento por tela -- proteger o comportamento de foco contra regressão.

**Acceptance Criteria:**
- Given que o usuário executa uma busca em uma das três listagens públicas, when submete o formulário de pesquisa, then a URL de navegação inclui o fragmento da área de resultados e a página abre focada nessa seção.
- Given que o usuário abre a listagem sem submeter pesquisa, when carrega a página, then o comportamento padrão da tela é preservado sem mudanças de fluxo.

## Spec Change Log

## Verification

**Commands:**
- `rtk bundle exec rspec spec/features/busca_produtores_produtos_servicos_spec.rb` -- expected: exemplos verdes cobrindo persistência de termo, feedback sem resultados e fragmento de foco nas três telas.
