#!/bin/bash

DATADIR="/webapp"

# Don't continue if we catch an error.
set -e

# Ensure server owns the DATADIR
chown -R www-data $DATADIR

cd $DATADIR

service mysql restart

echo 'y' | mysqladmin -S /var/run/mysqld/mysqld.sock -uroot -proot drop test

mysqladmin -S /var/run/mysqld/mysqld.sock -uroot -proot create dev
mysqladmin -S /var/run/mysqld/mysqld.sock -uroot -proot create tets
mysqladmin -S /var/run/mysqld/mysqld.sock -uroot -proot create prod

bundle install
rake db:create
rake db:migrate
rails s
