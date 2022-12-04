FROM alpine:3.16

# Installation de MariaDB
RUN apk update && \
	apk add --no-cache mariadb \
	mariadb-common \
	mariadb-client

# ATTENTION : le fichier de conf est dans /etc "my.cnf"

# Mettre notre fichier de conf dans le Docker
COPY conf/mariadb.conf /etc/my.cnf.d/mariadb.conf

# Mettre notre script dans le Docker
COPY ./script/script.sh /

CMD ["sh", "script.sh"]
