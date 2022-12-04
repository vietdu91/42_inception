FROM alpine:3.16

# Installation de WordPress
RUN apk update && \
	apk add --no-cache wget \
	curl \
	php8 \
	php8-phar \
	php8-fpm \
	php8-mysqli \
	php8-iconv \
	mariadb-client

EXPOSE 9000

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Configuration de PHP
COPY ./conf/php.conf /etc/php8/php-fpm.d/

RUN	chown -R root:root /var/www/wordpress

# Installation de WP-CLI
RUN	mkdir -p /usr/share/www/html
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR	/usr/share/www/html

COPY script/auto_config.sh auto_config.sh

ENTRYPOINT ["sh", "auto_config.sh"]

CMD	["php-fpm8", "-F", "-R"]
