#!/bin/bash

# Checker si MySQL existe deja
if [ -d "/run/mysqld" ]; then
	echo "MySQL est deja la !"
	chown -R mysql:mysql /run/mysqld
else
	echo "MySQL est en train de naitre..."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d "/var/lib/mysql/mysql" ]; then
	echo "Les donnees MySQL existent deja !"
	chown -R mysql:mysql /var/lib/mysql
else
	echo "MySQL est en train de pondre des petits oeufs de donnees..."
	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

	cat <<BABY > database_setup
FLUSH PRIVILEGES;
GRANT ALL ON *.* TO 'root'@'%' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;
DROP DATABASE IF EXISTS $SQL_USER;
CREATE OR REPLACE DATABASE $SQL_DATABASE;
CREATE USER '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASSWORD';
CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'localhost' WITH GRANT OPTION;
GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
BABY
	/usr/bin/mysqld --user=mysql --bootstrap < database_setup 
	rm -f database_setup

fi

exec "$@"