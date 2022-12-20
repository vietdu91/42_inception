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

if [ -d "$SQL_DATADIR/mysql" ]; then
	echo "Les donnees MySQL existent deja !"
	chown -R mysql:mysql $SQL_DATADIR
else
	echo "MySQL est en train de pondre des petits oeufs de donnees..."
	chown -R mysql:mysql $SQL_DATADIR
fi

cat .setup_db 2> /dev/null
if [ $? -ne 0 ]; then
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
	sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0\nport=3306|g" /etc/my.cnf.d/mariadb-server.cnf

	if ! mysqladmin --wait=30 ping; then
		echo "Le petit oiseau MySQL n'est jamais revenu au nid..."
		exit 1
	fi

	cat<<BABY > database_setup.sql
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
	mariadb < database_setup.sql
	pkill mariadb
	touch .setup_db
fi

usr/bin/mysqld_safe --datadir=/var/lib/mysql
exec "$@"