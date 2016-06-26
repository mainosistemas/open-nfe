#!/bin/bash
# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

apt-get -y update >/dev/null 2>&1v
install 'development tools' build-essential make curl

install Git git
install Redis redis-server

install PostgreSQL postgresql postgresql-contrib libpq-dev

echo 'Configurações do banco de dados'
sudo -u postgres createuser --superuser -w vagrant
sudo -u postgres psql --command "ALTER USER vagrant WITH PASSWORD 'vagrant';"

install 'ExecJS runtime' nodejs
