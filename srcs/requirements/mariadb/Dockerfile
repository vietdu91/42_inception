FROM alpine:3.16

# Installation de MariaDB
RUN apk update && \
	apk add --no-cache mariadb \
	mariadb-common \
	mariadb-client

RUN mkdir -p /var/lib/mysqld /run/mysqld

RUN mariadb-install-db --datadir=/var/lib/mysql \
		--auth-root-authentication-method=normal

# COPY ./script/heredoc.sh /
# Mettre notre script dans le Docker
COPY ./script/script.sh /

# RUN sh heredoc.sh


ENTRYPOINT ["sh", "script.sh"]
