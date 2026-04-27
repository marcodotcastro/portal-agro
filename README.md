# Aplicação ![favicon-32x32](https://github.com/heroku/favicon/raw/master/favicon.iconset/icon_32x32.png)

* Consumidor: [portal-agro.herokuapp.com](https://portal-agro.herokuapp.com/)
* Cooperativa/Sindicato Rural: [portal-agro.herokuapp.com/admin](https://portal-agro.herokuapp.com/admin)

# Apresentações
Informações Negociais            |  Principais Funcionalidades
:-------------------------:|:-------------------------:
[![Apresentação no Negócio](http://img.youtube.com/vi/_bOqoXSPfUs/0.jpg)](https://www.youtube.com/watch?v=_bOqoXSPfUs)  |  [![Apresentação das Funcionalidades](http://img.youtube.com/vi/0rfxWGPf_gM/0.jpg)](https://www.youtube.com/watch?v=0rfxWGPf_gM)
Video de Apresentação do Negócio, clique na imagem | Video de Apresentação das Funcionalidades, clique na imagem

# Documentação

* [Telas](https://github.com/marcodotcastro/portal-agro/wiki/Telas)
* [Qualidade](https://github.com/marcodotcastro/portal-agro/wiki/Qualidade)
* [Modelo de Dados](https://github.com/marcodotcastro/portal-agro/wiki/Modelo-de-Dados)
* [Instalação e Configuração](https://github.com/marcodotcastro/portal-agro/wiki/Instala%C3%A7%C3%A3o-e-Configura%C3%A7%C3%A3o)

# BMAD

* Node recomendado para o projeto: `22` (arquivo `.nvmrc`)
* Instalar BMAD: `npm run bmad:install`
* Atualizar BMAD: `npm run bmad:update`

# Execução local com Foreman

* Instalar foreman: `gem install foreman`
* Selecionar Ruby do projeto: `rvm use 2.6.7`
* Subir dependências via Docker: `docker compose up -d db redis`
* Iniciar aplicação: `foreman start -f Procfile.dev`
* Porta padrão da aplicação: `3003`
* Para usar outra porta: `PORT=3010 foreman start -f Procfile.dev`

# Portas padrão do projeto (isoladas)

* App (Rails): `3003`
* PostgreSQL (Docker -> host): `55432`
* Redis (Docker -> host): `56379`

Você pode sobrescrever esses valores com variáveis de ambiente (veja `.env.example`).
