#!bin/bash

sleep 10
cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root --dbname=inception --dbuser=inception_user --dbpass=inception_pass \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'

sleep 2
wp core install     --url=emtran.42.fr --title=inception --admin_user=emtran --admin_password=emtranpass --admin_email=emtran@outlook.fr --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author charlotte charlotte@gmail.com --user_pass=charlottepass --path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

exec /usr/sbin/php-fpm8 -F -R
