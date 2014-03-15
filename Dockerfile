# Rails 4 API environment with MySQL
#
# VERSION               0.1

FROM brice/mysql
MAINTAINER Geoffroy Lesage

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN echo mysql-server mysql-server/root_password password root | debconf-set-selections;
RUN echo mysql-server mysql-server/root_password_again password root | debconf-set-selections;
RUN apt-get install -y mysql-server mysql-client libmysql-ruby libmysqlclient-dev mysql-client-5.5

# Decouple webapp from container
VOLUME ["/webapp"]

ADD start.sh /start.sh
RUN chmod 755 /*.sh

EXPOSE 3000

CMD ["/run.sh"]