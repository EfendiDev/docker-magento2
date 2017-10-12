FROM ubuntu:16.04
MAINTAINER GokhanEfendi <gokhanefendi@gmail.com>

LABEL version="1.0" description="Environment for magento2 with nginx, php7 and mysql."

RUN apt-get update \
    && apt-get -y install software-properties-common \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y \
    && apt-get update \
    && apt-get -y install memcached \
    && apt-get -y install nginx php7.0-fpm php7.0-mysql php7.0-gd php7.0-cli php7.0-mcrypt php7.0-imagick php7.0-curl \
    && apt-get -y install php7.0-memcached php7.0-memcache libssh2-1-dev php7.0-ssh2 libfcgi0ldbl varnish git \
    && apt-get -y install php7.0-mbstring php7.0-xml php7.0-apcu php7.0-intl php7.0-zip php7.0-iconv php7.0-soap \
    && apt-get -y install composer nano curl \
    && rm -r /var/lib/apt/lists/* && mkdir /run/php/
