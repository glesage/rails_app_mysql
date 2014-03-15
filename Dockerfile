# Rails 4 API environment with MySQL
#
# VERSION               0.1

FROM glesage/nodejs-rails4
MAINTAINER Geoffroy Lesage

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN echo mysql-server mysql-server/root_password password root | debconf-set-selections;
RUN echo mysql-server mysql-server/root_password_again password root | debconf-set-selections;
RUN apt-get install -y mysql-server

RUN apt-get install -y mysql-client libmysql-ruby libmysqlclient-dev mysql-client-5.5

# Decouple webapp from container
VOLUME ["/webapp"]

EXPOSE 3000

ADD start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
