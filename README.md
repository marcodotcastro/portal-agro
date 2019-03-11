# INFORMAÇÕES

## Qualidade

```
rake rubycritic
```

Configuração -- lib/tasks/rubycritic.rake

## Deploy

### Heroku

```
heroku run bash
rails db:migrate 
rails c
Rails.application.load_seed
```
PS: Por algum muito motivo rodar o `rails db:seed` via `heroku run rails db:seed` não funciona

## Infraestrutura

- [Amazon S3](https://s3.console.aws.amazon.com/s3/buckets/active-storage-portal-agro/?region=us-east-2&tab=overview)
- [Amazon IAM](https://console.aws.amazon.com/iam/home?region=us-east-2#/users)