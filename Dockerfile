# Rails 4 API environment with MySQL
#
# VERSION               0.1

FROM glesage/nodejs-rails4
MAINTAINER Geoffroy Lesage

RUN export DEBIAN_FRONTEND=noninteractive
RUN echo mysql-server mysql-server/root_password password root | debconf-set-selections;\
  	echo mysql-server mysql-server/root_password_again password root | debconf-set-selections;\
  	apt-get install -y mysql-server mysql-client libmysql-ruby libmysqlclient-dev

RUN mkdir /home/app/

# Decouple webapp from container
VOLUME ["/webapp"]

EXPOSE 80

ADD start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]