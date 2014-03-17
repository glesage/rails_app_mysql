# Environment for Rails 4 with MySQL, Ruby 2.1.1 & NodeJS
#
# VERSION               0.1

FROM glesage/nodejs-rails4
MAINTAINER Geoffroy Lesage


RUN export DEBIAN_FRONTEND=noninteractive

#
# MySql
#
RUN apt-get -y install mysql-client-5.5 mysql-server-5.5


# Decouple webapp from container
VOLUME ["/webapp"]

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 3000

ENTRYPOINT ["/start.sh"]