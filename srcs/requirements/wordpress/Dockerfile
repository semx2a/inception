FROM debian:buster

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www

RUN cd /var/www \
	&& tar -xzf wordpress-6.2.2-fr_FR.tar.gz \
	&& rm ordpress-6.2.2-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress 



