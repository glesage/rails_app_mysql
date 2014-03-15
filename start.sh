#!/bin/bash

mysqld_safe

DATADIR="/webapp"

# Don't continue if we catch an error.
set -e

# Ensure server owns the DATADIR
chown -R www-data $DATADIR

cd $DATADIR

sleep 5

echo 'y' | mysqladmin -uroot -proot drop test

mysqladmin -uroot -proot create dev
mysqladmin -uroot -proot create tets
mysqladmin -uroot -proot create prod

bundle install
rake db:create
rake db:migrate
rails s