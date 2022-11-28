FROM alpine:3.16

# Installation de NGINX
RUN apk update && \
	apk add --no-cache nginx \
		openssl

# Creation d'un TSL (OPENSSL)
# https://www.shellhacks.com/create-csr-openssl-without-prompt-non-interactive/
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=Ile-de-France/L=Paris/O=42Paris/OU=Departement des BG/CN=emtran.42.fr/UID=emtran"


# Creation des fichiers de config
RUN mkdir -p /var/run/nginx

COPY conf/default.conf /etc/nginx/default.conf

EXPOSE 443
# Droits
#	Root
# RUN chmod 755 /var/www/html
#	User
# RUN chown -R www-data:www-data /var/www/html

# Permet de mettre NGINX en premier plan pour qu'il ne se stop pas
ENTRYPOINT	["nginx", "-g", "daemon off;"]
