FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/script.sh /
RUN chmod +x /script.sh

ENTRYPOINT [ "/script.sh" ]