FROM busybox

MAINTAINER Roman Ulashev <truetamtam@yandex.ru>

# mysql mirror folders in data container
# /etc/mysql - configs
# /var/lib/mysql - db data
# /var/log/mysql - logs
#
RUN mkdir -p /etc/mysql && \
    mkdir -p /var/lib/mysql && \
    mkdir -p /var/log/mysql && \


    mkdir /data && \

    # mysql data
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
    /var/log/mysql