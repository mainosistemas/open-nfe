# open-nfe
[![Build Status](https://travis-ci.org/mainosistemas/open-nfe.svg?branch=master)](https://travis-ci.org/mainosistemas/open-nfe)
[![Code Climate](https://codeclimate.com/github/mainosistemas/open-nfe/badges/gpa.svg)](https://codeclimate.com/github/mainosistemas/open-nfe)
[![Test Coverage](https://codeclimate.com/github/mainosistemas/open-nfe/badges/coverage.svg)](https://codeclimate.com/github/mainosistemas/open-nfe/coverage)
[![Issue Count](https://codeclimate.com/github/mainosistemas/open-nfe/badges/issue_count.svg)](https://codeclimate.com/github/mainosistemas/open-nfe)

# Configurando o projeto:
## Dependências:
- Ruby 2.3.1
- Bundle (`gem install bundle`)
- PostgreSQL
- Redis

## Instalação:
- Dentro do projeto execute `bundle install`
- Execute `cp config/database.example.yml config/database.yml` e faça qualquer configuração necessária no database.yml
- Execute `rake db:create && rake db:migrate && rake db:seed && rake db:test:prepare`
- Se quiser, execute `rspec` para que todos os testes sejam executados e verificar se tudo está funcionando
- Pronto!

# Utilizando o Vagrant:
## Dependências:
- Vagrant
- VirtualBox

## No Windows:
- Algum cliente SSH. Recomendo utilizar o [cmder](http://cmder.net/), que já vem com um cliente SSH instalado

# Instalação:
- Abra o terminal com permissão de administrador
- Execute `vagrant up`
- Quando a instalação terminar, acesse a VM com o comando `vagrant ssh`
- Dentro da VM, acesse a pasta `/vagrant` (`cd /vagrant`)
- Execute `rails s -b 0.0.0.0`
- No host, acesse `localhost:3000`
