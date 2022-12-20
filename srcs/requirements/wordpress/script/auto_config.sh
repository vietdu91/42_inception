#!bin/bash

grep wp_version wp-includes/version.php 2> /dev/null 1>&2
if [ ! "$?" -eq 0 ]; then
echo "Le petit oiseau de WordPress arrive a grand pas..."
wp core download
fi

cp wp-config-sample.php wp-config.php
sed -i "s/username_here/$SQL_USER/g" wp-config.php
sed -i "s/password_here/$SQL_PASSWORD/g" wp-config.php
sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config.php
sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config.php

mysql --user=$SQL_USER \
	      --password=$SQL_PASSWORD \
	      --host=$SQL_HOSTNAME \
	      $SQL_DATABASE 

exit_status=$?
while [ $exit_status == 1 ]; 
do 
	echo "On attend le petit nid qui se fait... Database en vue (Retry dans 10 secondes...)"
	sleep 10 
    mysql --user=$SQL_USER \
	      --password=$SQL_PASSWORD \
	      --host=$SQL_HOSTNAME \
	      $SQL_DATABASE 
	exit_status=$?
done

if ! wp core is-installed; then
echo "Le petit oiseau Wordpress s'installe sur son petit nid..."
wp core install --url="$WORDPRESS_URL" \
		--title="$WORDPRESS_TITLE" \
		--admin_name="$WORDPRESS_ADMIN" \
		--admin_email="$WORDPRESS_MAIL" \
		--admin_password="$WORDPRESS_PASS"
fi

if [ ! $WORDPRESS_THEME == "" ]; then
	rm -rf ./wp-content/themes/*
	wp theme install $WORDPRESS_THEME --activate
fi

exec "$@"
