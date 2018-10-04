FROM ubuntu:16.04
MAINTAINER GokhanEfendi <gokhanefendi@gmail.com>

LABEL version="1.0" description="Environment for magento2 with nginx, php7 and mysql."

RUN apt-get update \
    && apt-get -y install software-properties-common \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y \
    && apt-get update \
    && apt-get -y install memcached \
    && apt-get -y install nginx php7.1-fpm php7.1-mysql php7.1-gd php7.1-cli php7.1-mcrypt php7.1-imagick php7.1-curl \
    && apt-get -y install php7.1-memcached php7.1-memcache libssh2-1-dev php7.1-ssh2 libfcgi0ldbl varnish git \
    && apt-get -y install php7.1-mbstring php7.1-xml php7.1-apcu php7.1-intl php7.1-zip php7.1-iconv php7.1-soap \
    && apt-get -y install php7.1-bcmath php7.1-common composer nano curl \
    && rm -r /var/lib/apt/lists/* && mkdir /run/php/
