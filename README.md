Finanças em Família
=======

https://travis-ci.org/LilianeBifano/financasemfamilia.svg?branch=master

**Finanças em Família** é uma aplicação que tem por objetivo aumentar o controle financeiro das famílias, elaborando, substancialmente:
- Análises visual dos principais gastos e ganhos da família;
- Caixa consolidado da família.


## Setup do Projeto

### Pré requisitos

 - Ter [Ruby](https://www.ruby-lang.org) versão 2.5.1 previamente instalado na máquina

### Configurando e executando testes

 - `bin/setup`
 - `bundle exec rspec`

#### Docker
 - `docker-compose build`
 - `docker-compose run --rm web bin/setup`
 - `docker-compose run --rm --service-ports web bash`
 - `bundle exec rspec`

### Executando a aplicação

Após os passos de configuração executar o comando `rails server` e acessar pela
url [http://localhost:3000/](http://localhost:3000/).

#### Docker
 - `docker-compose build`
 - `docker-compose run --rm web bin/setup`
 - `docker-compose run --rm web rails assets:precompile`
 - `docker-compose up`

## Contribuindo
1. Faça um fork do projeto.
2. Clone seu projeto!
2. Crie sua feature branch: `git checkout -b <sua-feature>`
3. Commit suas mudanças: `git commit -am 'Minha super feature'`
4. Envie seu branch para o repositório: `git push origin <sua-feature>`
5. Envie um Pull Request :D

### Principais contribuidores
 - [eduardoekoch](https://github.com/eduardoekoch)
 - [EvangelistaR](https://github.com/EvangelistaR)
 - [LilianeBifano](https://github.com/LilianeBifano)
 - [mvbvieira](https://github.com/mvbvieira)
 - [campuscode](https://www.campuscode.com.br/)
