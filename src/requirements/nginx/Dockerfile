FROM debian:buster

#Install dependencies
RUN	apt-get update && apt-get upgrade -y
RUN apt-get install -y \
	nginx \
	openssl

#TSL
RUN	mkdir -p /etc/nginx/ssl
RUN openssl req \
	-x509 \
	-nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=seozcan.42.fr/UID=seozcan"

#Configuration files

COPY conf/wordpress.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

RUN chmod 755 /var/www/
RUN chown -R www-data:www-data /var/www/

CMD [ "nginx", "-g", "daemon off;" ]