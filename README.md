Rails App & MySql Dockerfile
===============


This repository contains **Dockerfile** of [MySql](http://www.mysql.com/) for [Docker](https://www.docker.io/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [glesage/nodejs-rails4](https://index.docker.io/u/glesage/nodejs-rails4)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [build](https://index.docker.io/u/glesage/rails-app-mysql/) from public [Docker Registry](https://index.docker.io/): `docker pull glesage/rails-app-mysql`


### Usage

    docker run -t -i -p 80:80 glesage/rails-app-mysql


### Stack

- Ruby 2.1.1
- NodeJS
- Rails 4
- MySql
