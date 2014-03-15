#!/bin/bash

DATADIR="/webapp"

# Don't continue if we catch an error.
set -e

# Ensure server owns the DATADIR
chown -R www-data $DATADIR

cd $DATADIR

service mysql restart

cat /etc/mysql/my.cnf
var=$(cat /etc/mysql/my.cnf)
echo $var

echo 'y' | mysqladmin -S /run/mysqld/mysqld.sock -uroot -proot drop test

mysqladmin -S /run/mysqld/mysqld.sock -uroot -proot create dev
mysqladmin -S /run/mysqld/mysqld.sock -uroot -proot create tets
mysqladmin -S /run/mysqld/mysqld.sock -uroot -proot create prod

bundle install
rake db:create
rake db:migrate
rails s
