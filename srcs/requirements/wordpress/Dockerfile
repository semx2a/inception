FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
	unzip \
	php \
	curl \
	wget \
	redis \
	php-redis \
	php-mysqli \
	php-fpm \
	php-cgi \
	php-curl \
	php-gd \
	php-mbstring \
	php-xml \
	php-xmlrpc \
	php-soap \
	php-intl \
	php-zip

RUN apt-get install -y default-mysql-client

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir -p /run/php

RUN mkdir -p /var/www/html/wordpress
COPY conf/index.php /var/www/html/wordpress/

EXPOSE 9000

COPY tools/wp_cli.sh /
RUN chmod +x /wp_cli.sh

ENTRYPOINT [ "/wp_cli.sh" ]
