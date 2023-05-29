#!/bin/sh

FILE=/var/www/wordpress/wp-config.php
cd /var/www/wordpress

if test ! -f "$FILE"; then
	
	#wp-cli install
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp


	#wordpress download and unzip
	wp core download --allow-root

	#sleep to allow mariadb time to setup
	sleep 5

	#database setup
	wp config create \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--allow-root

	sleep 5

	#webpage setup
	wp core install \
		--url=$DOMAIN_NAME \
		--title="Semiha's Inception" \
		--admin_user=$WP_ADMIN_USR \
		--admin_password=$WP_ADMIN_PSSWD \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root
	
	#user setup
	wp user create \
		$WP_USER_USR \
		$WP_USER_MAIL \
		--role=$WP_USER_ROLE \
		--user_pass=$WP_USER_PSSWD \
		--porcelain \
		--allow-root

fi

/usr/sbin/php-fpm7.3 -F