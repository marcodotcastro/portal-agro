# Apresentações
Informações Negociais            |  Principais Funcionalidades
:-------------------------:|:-------------------------:
[![Apresentação no Negócio](http://img.youtube.com/vi/_bOqoXSPfUs/0.jpg)](https://www.youtube.com/watch?v=_bOqoXSPfUs)  |  [![Apresentação das Funcionalidades](http://img.youtube.com/vi/0rfxWGPf_gM/0.jpg)](https://www.youtube.com/watch?v=0rfxWGPf_gM)
Video de Apresentação do Negócio, clique na imagem | Video de Apresentação das Funcionalidades, clique na imagem

# Qualidade

Descrição | Qualidade de Código | Cobertura de Código
:-------------------------:|:-------------------------:|:-------------------------:
Print | ![Qualidade](public/images/qualidade.png) | ![Cobertura](public/images/cobertura.png)
Execução | $ bundle exec rake rubycritic app | $ bundle exec rake rubycritic app
Relatório | HOME_PROJECT/tmp/rubycritic/overview.html | HOME_PROJECT/coverage/index.html

# Informações Técnicas

## Variáveis de Ambiente

### Image Server
- ENV['AWS_ACCESS_KEY_ID']
- ENV['AWS_SECRET_ACCESS_KEY_ID']
- ENV['AWS_REGION']
- ENV['AWS_BUCKET']

## Running

> Clone o projeto

> Instale o ruby 2.6.6

> Agora execute

```
bundle install
rails db:create db:migrate db:seed 
rails s
```


## Infraestrutura

- [Amazon S3](https://s3.console.aws.amazon.com/s3/buckets/active-storage-portal-agro/?region=us-east-2&tab=overview)
- [Amazon IAM](https://console.aws.amazon.com/iam/home?region=us-east-2#/users)
