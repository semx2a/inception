#!/bin/sh

FILE=/var/www/html/wordpress/wp-config.php

sleep 10

if test -f "$FILE"; then
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/html/wordpress'
fi