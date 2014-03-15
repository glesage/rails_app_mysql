#!/bin/bash

DATADIR="/webapp"

# Don't continue if we catch an error.
set -e

# Ensure server owns the DATADIR
chown -R www-data $DATADIR

cd $DATADIR

echo 'y' | mysqladmin -uroot -proot drop test

echo 'y' | mysqladmin -uroot -proot create dev
echo 'y' | mysqladmin -uroot -proot create tets
echo 'y' | mysqladmin -uroot -proot create prod

bundle install
rake db:create
rake db:migrate
rails s
