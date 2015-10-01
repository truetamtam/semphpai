FROM debian:jessie

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

# mysql nginx php-fpm main volumes
# mysql dirs
#
RUN mkdir /etc/mysql && \
    mkdir -p /var/lib/mysql && \
    mkdir -p /var/log/mysql && \

    # mysql folders permissions
    #
    chown 999:999 /var/lib/mysql && \
    chmod 770 /var/lib/mysql && \
    chown 999:999 /var/log/mysql && \

    # nginx folders
    #
    mkdir -p /var/log/nginx && \

    # php-fpm folders
    #


    # data folders for mysql nginx php-fpm,
    # and symlinks to them in data container
    #
    mkdir /data && \

        # mysql data links
        #
        mkdir /data/mysql && \
        ln -s /etc/mysql /data/mysql/config && \
        ln -s /var/log/mysql /data/mysql/log && \
        ln -s /var/lib/mysql /data/mysql/dbdata && \

        # nginx data links
        #
        mkdir /data/nginx && \
        ln -s /etc/nginx /data/nginx/config && \
        ln -s /var/log/nginx /data/nginx/log

# pointing all system related volumes
#
VOLUME /data \
    /etc/mysql \
    /var/lib/mysql \
    /var/log/mysql \
    /etc/nginx \
    /usr/share/nginx/html/