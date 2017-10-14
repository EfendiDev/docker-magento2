#!/bin/bash

/usr/sbin/php-fpm7.0 -R &
/usr/sbin/nginx -g "daemon off;" &
/usr/bin/memcached -u root
echo "Welcome on Board!"

file="/data/projects/docker-magento2/.magento2_installed"

if [ -f "$file" ]
then
	php /data/projects/docker-magento2/magento2/bin/magento setup:store-config:set --base-url="http://${MAGENTO_BASE_URL}"
	php /data/projects/docker-magento2/magento2/bin/magento cache:flush
else
        composer create-project --repository-url=https://${MAGENTO_PUBLIC_KEY}:${MAGENTO_PRIVATE_KEY}@repo.magento.com/ magento/project-community-edition /data/projects/docker-magento2/magento2
	if php /data/projects/docker-magento2/magento2/bin/magento setup:install --base-url="http://${MAGENTO_BASE_URL}/" --db-host="magento2_mysql" --db-name="magento2" --db-user="root" --admin-firstname="admin" --admin-lastname="admin" --admin-email="user@example.com" --admin-user="admin" --admin-password="Admin123*!" --language="en_US" --currency="USD" --timezone="Europe/Istanbul" --use-rewrites="1" --backend-frontname="admin" ; then
	    echo "" > /data/projects/docker-magento2/.magento2_installed
	    echo "Magento 2 Community Edition successfully installed."
	else
	    echo "Oops, I need help! ¯\_(ツ)_/¯ "
	fi
fi