FROM debian:buster

#Install dependencies
RUN	apt update && apt install -y \
	nginx \
	openssl \
	&& rm -rf /vat/lib/apt/lists/*

#TSL
RUN	mkdir -p /etc/nginx/ssl \
	&& openssl req \
	-x509 \
	-nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

#Configuration files

COPY conf/wordpress.conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled 

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html/

#RUN service nginx start

CMD [ "nginx", "-g", "daemon off;" ]