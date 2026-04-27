---
stepsCompleted:
  - step-01-validate-prerequisites
  - step-02-design-epics
  - step-03-create-stories
  - step-04-final-validation
inputDocuments:
  - /home/marcodotcastro/RubymineProjects/portal-agro/_bmad-output/planning-artifacts/prd.md
---

# portal-agro - Epic Breakdown

## Overview

This document provides the complete epic and story breakdown for portal-agro, decomposing the requirements from the PRD, UX Design if it exists, and Architecture requirements into implementable stories.

## Requirements Inventory

### Functional Requirements

FR1: O sistema deve permitir criar pedido B2C a partir da pagina de produto.
FR2: O sistema deve validar campos obrigatorios do formulario.
FR3: O sistema deve persistir pedidos com data/hora de criacao.
FR4: O produtor deve visualizar lista de pedidos ordenada por mais recentes.
FR5: O produtor deve alterar status do pedido para acompanhar andamento.

### NonFunctional Requirements

NFR1: Fluxo de criacao de pedido deve ser mobile-first.
NFR2: Registro de pedido deve ser concluido em ate 3 passos para o comprador.
NFR3: Dados devem ficar disponiveis para consulta historica no painel do produtor.

### Additional Requirements

- Nenhum requisito adicional de arquitetura foi extraido nesta etapa enxuta (arquivo architecture.md nao encontrado).

### UX Design Requirements

- Nenhum requisito de UX foi extraido nesta etapa enxuta (arquivo ux design nao encontrado).

### FR Coverage Map

FR1: Epic 1 - Criar pedido B2C na pagina de produto
FR2: Epic 1 - Validar campos obrigatorios do formulario
FR3: Epic 1 - Persistir pedido com data/hora
FR4: Epic 1 - Listar pedidos no painel do produtor
FR5: Epic 1 - Atualizar status do pedido

## Epic List

### Epic 1: Pedido B2C Simples e Gestao Inicial pelo Produtor
Permitir que o comprador final envie pedido diretamente pela pagina de produto e que o produtor acompanhe e atualize o status no painel, substituindo o fluxo informal via WhatsApp por registro estruturado no portal.
**FRs covered:** FR1, FR2, FR3, FR4, FR5.

## Epic 1: Pedido B2C Simples e Gestao Inicial pelo Produtor

Permitir que o comprador final envie pedido diretamente pela pagina de produto e que o produtor acompanhe e atualize o status no painel, substituindo o fluxo informal via WhatsApp por registro estruturado no portal.

### Story 1.1: Iniciar Pedido B2C na Pagina de Produto

As a comprador final,
I want iniciar um pedido direto na pagina de produto,
So that eu nao precise abrir WhatsApp para comecar a compra.

**Acceptance Criteria:**

**Given** que estou na pagina de um produto publicado
**When** clico em "Fazer Pedido"
**Then** o sistema abre o formulario de pedido ja vinculado ao produto
**And** o fluxo funciona em layout mobile sem quebra visual

### Story 1.2: Enviar Pedido com Validacao e Persistencia

As a comprador final,
I want enviar um pedido com dados minimos obrigatorios,
So that o produtor receba uma solicitacao completa para contato.

**Acceptance Criteria:**

**Given** que preenchi o formulario de pedido
**When** envio com campos obrigatorios validos
**Then** o sistema cria o pedido com status inicial `novo` e registra data/hora
**And** exibe confirmacao de envio ao comprador

**Given** que ha campos obrigatorios invalidos ou vazios
**When** tento enviar
**Then** o sistema bloqueia envio e mostra erros por campo
**And** o pedido nao e criado

### Story 1.3: Listar Pedidos no Painel do Produtor

As a produtor,
I want visualizar os pedidos recebidos em uma lista ordenada,
So that eu consiga priorizar atendimento comercial rapidamente.

**Acceptance Criteria:**

**Given** que existem pedidos cadastrados
**When** acesso o painel de pedidos
**Then** vejo a lista ordenada do mais recente para o mais antigo
**And** cada item mostra dados minimos (comprador, produto, quantidade, status, data/hora)

**Given** que um novo pedido foi criado
**When** atualizo o painel
**Then** o pedido aparece na listagem em ate 5 segundos
**And** ele respeita a ordenacao por recencia

### Story 1.4: Atualizar Status do Pedido

As a produtor,
I want atualizar o status do pedido no painel,
So that eu acompanhe o andamento da tratativa fora da plataforma.

**Acceptance Criteria:**

**Given** que estou visualizando um pedido no painel
**When** altero o status para `em_contato`, `concluido` ou `cancelado`
**Then** o sistema salva o novo status com sucesso
**And** o status atualizado fica visivel na listagem

**Given** que tento usar um status invalido
**When** confirmo a alteracao
**Then** o sistema rejeita a operacao com mensagem de erro
**And** mantem o status anterior sem alteracao
