---
title: 'Persistir termo de busca e avisar quando não houver resultados'
type: 'feature'
created: '2026-04-27'
status: 'done'
baseline_commit: 'd4328882ba4d14f2f82f34e52d58869645099e06'
context: []
---

<frozen-after-approval reason="human-owned intent — do not modify unless human renegotiates">

## Intent

**Problem:** As páginas de listagem de produtores, produtos e serviços não preservam o termo digitado no campo de nome após a pesquisa e não exibem aviso claro quando a busca retorna vazio.

**Approach:** Ligar o campo de nome ao `search_form_for` em todas as três telas para manter o valor submetido e tratar coleção vazia nos parciais de listagem com mensagem explícita por tipo.

## Boundaries & Constraints

**Always:** Manter a regra de negócio e escopo de consulta existentes; alterar apenas camada de apresentação; aplicar o mesmo comportamento em produtores, produtos e serviços.

**Ask First:** Nenhum.

**Never:** Alterar scopes, controllers, paginação, regras de publicação ou fluxo principal do módulo.

## I/O & Edge-Case Matrix

| Scenario | Input / State | Expected Output / Behavior | Error Handling |
|----------|--------------|---------------------------|----------------|
| Busca sem resultados | Usuário busca por nome inexistente | Campo de nome mantém valor e página mostra aviso claro de vazio | N/A |
| Busca com resultados | Usuário busca por nome existente | Resultados são exibidos normalmente e sem mensagem de vazio | N/A |

</frozen-after-approval>

## Code Map

- `app/views/produtores/index.html.erb` -- Formulário de busca por nome de produtores.
- `app/views/produtos/index.html.erb` -- Formulário de busca por nome de produtos.
- `app/views/servicos/index.html.erb` -- Formulário de busca por nome de serviços.
- `app/views/produtores/_produtor_each.html.erb` -- Renderização da lista e fallback vazio de produtores.
- `app/views/produtos/_produto_each.html.erb` -- Renderização da lista e fallback vazio de produtos.
- `app/views/servicos/_servico_each.html.erb` -- Renderização da lista e fallback vazio de serviços.
- `spec/features/busca_produtores_produtos_servicos_spec.rb` -- Cobertura dos critérios de aceite em UI.

## Tasks & Acceptance

**Execution:**
- [x] `app/views/produtores/index.html.erb` -- trocar input manual por campo ligado ao `search_form_for` -- preservar termo pesquisado.
- [x] `app/views/produtos/index.html.erb` -- trocar input manual por campo ligado ao `search_form_for` -- preservar termo pesquisado.
- [x] `app/views/servicos/index.html.erb` -- trocar input manual por campo ligado ao `search_form_for` -- preservar termo pesquisado.
- [x] `app/views/produtores/_produtor_each.html.erb` -- exibir mensagem de lista vazia -- feedback claro em busca sem retorno.
- [x] `app/views/produtos/_produto_each.html.erb` -- exibir mensagem de lista vazia -- feedback claro em busca sem retorno.
- [x] `app/views/servicos/_servico_each.html.erb` -- exibir mensagem de lista vazia -- feedback claro em busca sem retorno.
- [x] `spec/features/busca_produtores_produtos_servicos_spec.rb` -- testar persistência do termo e mensagem de vazio nas três telas -- proteger contra regressão.

**Acceptance Criteria:**
- Given que o usuário pesquisa por nome sem correspondência, when submete a busca em produtores, produtos ou serviços, then o campo de nome permanece preenchido e uma mensagem clara de nenhum resultado é exibida.
- Given que o usuário usa as páginas de listagem, when o ajuste é aplicado, then nenhuma regra de negócio de publicação/filtro é alterada.

## Spec Change Log

## Verification

**Commands:**
- `rtk bundle exec rspec spec/features/busca_produtores_produtos_servicos_spec.rb` -- expected: 3 examples, 0 failures
