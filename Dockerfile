# Environment for Rails 4 with MySQL, Ruby 2.1.1 & NodeJS
#
# VERSION               0.1

FROM brice/mysql
MAINTAINER Geoffroy Lesage


RUN export DEBIAN_FRONTEND=noninteractive

#
# Ruby
#
RUN apt-get update
RUN apt-get -q -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

ADD http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz /tmp/

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ADD http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz /tmp/
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev && \
    tar -xzf /tmp/ruby-2.1.1.tar.gz && \
    (cd ruby-2.1.1/ && ./configure --disable-install-doc && make && make install) && \
    rm -rf ruby-2.1.1/ && \
    rm -f /tmp/ruby-2.1.1.tar.gz


#
# NodeJS
#
RUN apt-get install -y software-properties-common 
RUN add-apt-repository -y ppa:chris-lea/node.js 
RUN apt-get update && apt-get install -y nodejs

#
# Rails
#
RUN gem install --no-rdoc --no-ri rails

# Decouple webapp from container
VOLUME ["/webapp"]

ADD start.sh /start.sh
RUN chmod 755 /*.sh

EXPOSE 3000

ENTRYPOINT["/start.sh"]