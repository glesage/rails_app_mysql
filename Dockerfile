# Rails 4 API environment with MySQL
#
# VERSION               0.1

FROM glesage/nodejs-rails4
MAINTAINER Geoffroy Lesage

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

RUN echo mysql-server mysql-server/root_password password root | debconf-set-selections;
RUN echo mysql-server mysql-server/root_password_again password root | debconf-set-selections;
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

RUN apt-get install -y mysql-client libmysql-ruby libmysqlclient-dev mysql-client-5.5

# Decouple webapp from container
VOLUME ["/webapp"]

ADD start.sh /start.sh
ADD run.sh /run.sh
ADD supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 755 /*.sh

EXPOSE 3000

CMD ["/run.sh"]