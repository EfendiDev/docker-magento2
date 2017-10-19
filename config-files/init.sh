#!/bin/bash

echo "Welcome on Board!"

if [ "$MAGENTO_BASE_URL" = "" ]
then
	echo "MAGENTO_BASE_URL is missing!"
	echo "Please set it using this command:"
	echo "export MAGENTO_BASE_URL=http://magento2.local"
	echo "Then re-try it please!"
	exit
fi

file="/data/project/.magento2_installed3"

if [ -f "$file" ]
then
	php /data/project/magento2/bin/magento setup:store-config:set --base-url="${MAGENTO_BASE_URL}"
	php /data/project/magento2/bin/magento cache:flush
else
    echo "Magento 2 Community Edition successfully installed."
    cd /data/project/magento2
    composer require efendi/shopfinder dev-master
    composer install
    php /data/project/magento2/bin/magento setup:upgrade
    php /data/project/magento2/bin/magento cache:flush
fi

echo "Magento admin url: $MAGENTO_BASE_URL/admin"
echo "Magento admin username: admin"
echo "Magento admin password: admin123"

/usr/sbin/php-fpm7.0 -R &
/usr/sbin/nginx -g "daemon off;" &
/usr/bin/memcached -u root