Environment for Rails App with MySql, Ruby 2.1.1 & NodeJS
===============


This Dockerfile is published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [brice/mysql/](https://index.docker.io/u/brice/mysql)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [build](https://index.docker.io/u/glesage/rails-app-mysql) from public [Docker Registry](https://index.docker.io/): `docker pull glesage/rails-app-mysql`


### Usage

    docker run -d -p 3000:80 -v /home/me/webapp:/webapp glesage/rails-app-mysql


### Stack

- Ruby 2.1.1
- NodeJS
- Rails 4
- MySql
