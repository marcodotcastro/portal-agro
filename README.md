# Informações Negociais

[![Apresentação no Negócio](http://img.youtube.com/vi/oTl51RvgUnI/0.jpg)](http://www.youtube.com/watch?v=oTl51RvgUnI)

[Apresentação](https://prezi.com/p/_rif-zlt6law/?present=1)

## Principais Funcionalidades

[![Apresentação das Funcionalidades](http://img.youtube.com/vi/ro1X4nfyRUM/0.jpg)](http://www.youtube.com/watch?v=ro1X4nfyRUM)

# Informações Técnicas

## Variáveis de Ambiente

### Image Server
- ENV['AWS_ACCESS_KEY_ID']
- ENV['AWS_SECRET_ACCESS_KEY_ID']
- ENV['AWS_REGION']
- ENV['AWS_BUCKET']

## Deploy

### Heroku

```
heroku run bash
rails db:migrate 
rails c
Rails.application.load_seed
```
PS: Por algum muito motivo rodar o `rails db:seed` via `heroku run rails db:seed` não funciona

## Qualidade

```
shell> rubycritic app
```

Configuração -- lib/tasks/rubycritic.rake


## Infraestrutura

- [Amazon S3](https://s3.console.aws.amazon.com/s3/buckets/active-storage-portal-agro/?region=us-east-2&tab=overview)
- [Amazon IAM](https://console.aws.amazon.com/iam/home?region=us-east-2#/users)