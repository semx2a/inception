FROM	debian:buster

RUN		apt update\
		apt ugrade\
		apt install nginx -y\
		apt install vin -y\
		apt install curl -y\
		mkdir -p /etc/nginx/ssl\
		apt install OpenSSL -y\
		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"\
		mkdir -p /var/run/nginx

#COPY	conf/nginx.conf /etc/nginx/nginx.conf

