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
fi
