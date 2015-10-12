FROM debian:jessie

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

# data folders
RUN mkdir /data && \
    mkdir -p /usr/share/nginx/html && chown -R www-data:www-data /usr/share/nginx/html

# volumes
#
VOLUME /data \
    /var/lib/mysql \
    /usr/share/nginx/html