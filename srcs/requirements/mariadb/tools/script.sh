#!/bin/sh

service mysql start;

sleep 3

mysqladmin -u root password $MYSQL_ROOT_PASSWORD

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

exec mysqld_safe