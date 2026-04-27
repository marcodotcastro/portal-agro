---
stepsCompleted:
  - step-01-init
inputDocuments: []
documentCounts:
  productBriefs: 0
  research: 0
  brainstorming: 0
  projectDocs: 0
classification:
  projectType: web_app
  domain: general
  complexity: low
  projectContext: greenfield
fastTrack:
  enabled: true
  reason: "Pedido do usuario para pular etapas e focar no MVP"
workflowType: 'prd'
---

# PRD Simples - Portal Agro (MVP B2C)

**Author:** marcodotcastro
**Date:** 2026-04-27

## 1. Funcionalidade Mais Importante

Capturar **Pedidos B2C** dentro do Portal Agro em um fluxo simples, substituindo o uso informal de WhatsApp por registros estruturados e rastreaveis.

## 2. Problema

Hoje, os pedidos B2C acontecem principalmente fora da plataforma (WhatsApp), o que gera:

- perda de informacao historica
- baixa padronizacao de dados
- dificuldade de gestao e acompanhamento comercial

## 3. Objetivo do MVP

Permitir que comprador final envie pedido para um produto diretamente no portal, com dados minimos estruturados para gestao do produtor.

## 4. Usuarios

- **Produtor:** recebe e gerencia pedidos
- **Comprador Final:** cria pedido de forma simples e rapida

## 5. Escopo do MVP

### Em escopo

- Tela de produto com CTA "Fazer Pedido"
- Formulario simples de pedido com:
- nome do comprador
- contato (telefone e/ou email)
- produto
- quantidade desejada
- observacoes opcionais
- Registro do pedido no sistema com status inicial `novo`
- Painel simples para produtor listar pedidos recebidos
- Atualizacao basica de status do pedido pelo produtor (`novo`, `em_contato`, `concluido`, `cancelado`)

### Fora de escopo (agora)

- negociacao B2B
- contrapropostas complexas
- pagamento dentro da plataforma
- faturamento/nota fiscal automatizada
- integracoes externas

## 6. Fluxo Principal

1. Comprador acessa um produto.
2. Clica em "Fazer Pedido".
3. Preenche formulario simples e envia.
4. Sistema registra pedido com status `novo`.
5. Produtor visualiza pedido no painel.
6. Produtor entra em contato por canal externo e atualiza status no portal.

## 7. Requisitos Funcionais

- RF01: O sistema deve permitir criar pedido B2C a partir da pagina de produto.
- RF02: O sistema deve validar campos obrigatorios do formulario.
- RF03: O sistema deve persistir pedidos com data/hora de criacao.
- RF04: O produtor deve visualizar lista de pedidos ordenada por mais recentes.
- RF05: O produtor deve alterar status do pedido para acompanhar andamento.

## 8. Requisitos Nao Funcionais

- RNF01: Fluxo de criacao de pedido deve ser mobile-first.
- RNF02: Registro de pedido deve ser concluido em ate 3 passos para o comprador.
- RNF03: Dados devem ficar disponiveis para consulta historica no painel do produtor.

## 9. Criterios de Aceite (MVP)

- CA01: Comprador consegue enviar um pedido completo sem usar WhatsApp.
- CA02: Pedido enviado aparece no painel do produtor em menos de 5 segundos.
- CA03: Produtor consegue atualizar status do pedido sem erro.
- CA04: Cada pedido fica registrado com dados minimos e historico de status atual.

## 10. Metricas Iniciais

- Percentual de pedidos B2C iniciados no portal vs WhatsApp (meta a definir)
- Quantidade de pedidos B2C registrados por semana
- Tempo medio entre criacao do pedido e primeiro contato do produtor

## 11. Riscos e Decisoes

- **Risco:** produtor continuar usando WhatsApp sem registrar no portal.
- **Mitigacao:** fluxo rapido e painel simples para reduzir friccao.
- **Decisao:** pagamento e fechamento financeiro permanecem fora do portal no MVP.

## 12. Entrega Esperada

Primeira versao operacional de captura e acompanhamento basico de pedidos B2C, focada em gerar dados estruturados para gestao comercial.
