FROM php:fpm

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

# copying config to distr
#
RUN cp -a /usr/local/etc /usr/local/etc_dist

# required packages
#
RUN apt-get update && apt-get install -y --no-install-recommends \
    libxml2-dev \
    # postgre
    libpq-dev \
    # exif
    libicu-dev \
    libicu52 \
    # bz2
    libbz2-dev \
    # gd
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libxpm-dev \
    libvpx-dev \
    # ftp
    libssl-dev \
    # mcrypt
    libmcrypt-dev \
    # memcached
    libmemcached-dev && \
    # clean it
    rm -rf /var/lib/apt/lists/* && \
    # configure gd for use with jpeg
    #
docker-php-ext-configure gd \
    --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ && \
docker-php-ext-configure pgsql \
    --with-pgsql=/usr/local/pgsql && \

# required php extensions
#
# xdebug
#
curl -L -o /tmp/xdebug.tar.gz http://xdebug.org/files/xdebug-2.3.3.tgz && \
tar -xvf /tmp/xdebug.tar.gz -C /tmp && \
rm -f /tmp/xdebug.tar.gz && \
mv /tmp/xdebug-2.3.3 /usr/src/php/ext/xdebug && \

# installing extensions
# extra: xdebug
# Possible values for ext-name:
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mssql mysql
# mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection
# session shmop simplexml snmp soap sockets spl standard sybase_ct sysvmsg sysvsem sysvshm tidy tokenizer wddx xdebug xml xmlreader xmlrpc xmlwriter xsl zip

docker-php-ext-install \
    bcmath \
    bz2 \
    exif \
    intl \
    ftp \
    gd \
    gettext \
    mbstring \
    mcrypt \
    mysqli \
    opcache \
    mysql \
    pdo_mysql \
    pgsql \
    pdo_pgsql \
    shmop \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    zip \
    xdebug

# copying custom php.ini
#
#COPY conf/php.ini /usr/local/etc/php/php.ini
#COPY conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# starting php-fpm
#
#CMD (test -f /usr/local/etc/php-fpm.conf || cp -a /usr/local/etc_dist/* /usr/local/etc/) && php-fpm
#CMD ["php-fpm"]