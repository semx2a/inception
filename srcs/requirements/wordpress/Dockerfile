FROM debian:buster

RUN apt-get update

RUN apt-get install -y php \
	php-fpm \
	php-mysql \
	mariadb-client

RUN apt-get install -y wget
RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www/

RUN cd /var/www/ \
	&& tar -xzf wordpress-6.2.2-fr_FR.tar.gz \
	&& rm wordpress-6.2.2-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY conf/index.php /var/www/wordpress/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY tools/wp_cli.sh /
RUN chmod +x /wp_cli.sh



ENTRYPOINT [ "/wp_cli.sh" ]

CMD [ "usr/sbin/php-fpm7.3", "-F" ]
