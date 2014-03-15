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

RUN cd /tmp && \
    tar -xzf ruby-2.1.1.tar.gz && \
    cd ruby-2.1.1 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf ruby-2.1.1 && \
    rm -f ruby-2.1.1.tar.gz\
    echo "gem: --no-ri --no-rdoc" > ~/.gemrc

#
# NodeJS
#
RUN apt-get install -y software-properties-common 
RUN add-apt-repository -y ppa:chris-lea/node.js 
RUN apt-get update && apt-get install -y nodejs

#
# Rails
#
RUN gem install rails

# Decouple webapp from container
VOLUME ["/webapp"]

ADD start.sh /start.sh
RUN chmod 755 /*.sh

EXPOSE 3000

ENTRYPOINT["/start.sh"]