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
    mkdir -p /usr/local/etc && \

    # www
    #
    mkdir -p /usr/share/nginx/html && \
    chown -R www-data:www-data /usr/share/nginx/html && \
    chmod -R +x /usr/share/nginx/html && \

    # data folders for mysql nginx php-fpm,
    # and symlinks to them in data container
    #
    mkdir /data && \

        # mysql data links
        #
        mkdir /data/mysql && \
        ln -s /etc/mysql /data/mysql/conf && \
        ln -s /var/log/mysql /data/mysql/log && \
        ln -s /var/lib/mysql /data/mysql/dbdata && \

        # nginx data links
        #
        mkdir /data/nginx && \
        ln -s /etc/nginx /data/nginx/conf && \
        ln -s /var/log/nginx /data/nginx/log && \

        # php-fpm data links
        #
        mkdir /data/php-fpm && \
        ln -s /usr/local/etc /data/php-fpm/conf


# pointing all system related volumes
#
VOLUME /data \
    /etc/mysql \
    /var/lib/mysql \
    /var/log/mysql \
    /var/log/nginx \
    /etc/nginx \
    /usr/local/etc \
    /usr/share/nginx/html