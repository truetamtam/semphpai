FROM busybox

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

RUN mkdir /etc/mysql && \
    mkdir -p /var/lib/mysql && \
    mkdir -p /var/log/mysql && \

    # nginx folders
    #
    mkdir -p /usr/share/nginx/html/ && \
    chown 1000:1000 /usr/share/nginx/html/ && \

    # mysql folders permissions
    #
    #chown 999:999 /var/lib/mysql && \
    #chmod 770 /var/lib/mysql && \
    #chown 999:999 /var/log/mysql && \

    mkdir /data && \

    # mysql data links
    #
    mkdir -p /data/mysql && \
    ln -s /etc/mysql /data/mysql/config && \
    ln -s /var/log/mysql /data/mysql/log && \
    ln -s /var/lib/mysql /data/mysql/dbdata

# pointing all system related volumes
#
VOLUME /data \
    /etc/mysql \
    /var/lib/mysql \
    /var/log/mysql \
    /etc/nginx \
    /usr/share/nginx/html/