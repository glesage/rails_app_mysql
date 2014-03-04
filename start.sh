#!/bin/bash
# Starts up Nginx and PHP within the container.

DATADIR="/webapp"

# Don't continue if we catch an error.
set -e

# Ensure mysql owns the DATADIR
chown -R www-data $DATADIR

WORKDIR $DATADIR

bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails s -d -p80