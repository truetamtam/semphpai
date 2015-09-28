FROM busybox

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

RUN mkdir /etc/mysql && \
    mkdir -p /var/lib/mysql && \
    mkdir -p /var/log/mysql && \

    # nginx folders
    #
    mkdir -p /etc/nginx/sites-available && \
    mkdir -p /etc/nginx/sites-enabled && \
    # main www-root permissions and grouping
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    chmod 770 /var/www/html && \

    # mysql folders permissions
    #
    chown 999:999 /var/lib/mysql && \
    chmod 770 /var/lib/mysql && \
    chown 999:999 /var/log/mysql && \

    mkdir /data && \

    # mysql data links
    #
    mkdir -p /data/mysql && \
    ln -s /etc/mysql /data/mysql/config && \
    ln -s /var/log/mysql /data/mysql/log && \
    ln -s /var/lib/mysql /data/mysql/dbdata && \

    # nginx data link
    mkdir -p /data/nginx/sites-available && \
    ln -s /etc/nginx/sites-available /data/nginx/sites-available

# pointing all system related volumes
#
VOLUME /data \
    /etc/mysql \
    /var/lib/mysql \
    /var/log/mysql \
    /etc/nginx \
    /var/log/nginx \
    /usr/share/nginx/html