# Camada de Abstração Volt — Portal Agro

Este diretório e os manifestos `Dockerfile.volt` e `docker-compose.volt.yml` compõem a camada de isolamento autônomo do projeto para execução pelo ecossistema Volt.

## Inicialização Isolada
```bash
# Subir aplicação isolada
docker compose -f docker-compose.volt.yml up -d

# Visualizar logs
docker compose -f docker-compose.volt.yml logs -f app

# Derrubar aplicação
docker compose -f docker-compose.volt.yml down
```

## Características
- **Stack:** Ruby 3.3.6 / Rails 8 / SQLite3 WAL
- **Porta Padrão:** `3001` (mapeada internamente para `3000`)
- **Volumes:** `./storage` persistido em disco
