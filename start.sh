#!/bin/bash

exec DATADIR="/webapp"

# Don't continue if we catch an error.
exec set -e

# Ensure server owns the DATADIR
exec chown -R www-data $DATADIR

exec cd $DATADIR

exec mysqld_safe

exec echo 'y' | mysqladmin -uroot -proot drop test

exec mysqladmin -uroot -proot create dev
exec mysqladmin -uroot -proot create tets
exec mysqladmin -uroot -proot create prod

exec bundle install
exec rake db:create
exec rake db:migrate
exec rails s
