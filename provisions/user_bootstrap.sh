#!/bin/bash

echo 'RVM'
curl -L get.rvm.io > rvm-install
bash < ./rvm-install
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bashrc
source ~/.bashrc
source /home/vagrant/.rvm/scripts/rvm

echo 'Ruby 2.3.1'
rvm install ruby-2.3.1
bash -l -c "rvm use 2.3.1"
cd /vagrant

echo 'Bundle'
gem install bundle

echo 'bundle install'
bundle install

echo 'Cria o banco'
cp config/database.example.yml config/database.yml
rake db:create && rake db:migrate && rake db:seed && rake db:test:prepare

echo 'Tudo pronto!'
