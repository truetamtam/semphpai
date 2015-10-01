FROM php:5.6-fpm

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

# required packages
#
RUN apt-get update &&  apt-get install -y --no-install-recommends \
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
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # configure gd for use with jpeg
    #
docker-php-ext-configure gd \
    --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
    --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ && \
# required php extensions
#
# xdebug
#
curl -L -o /tmp/xdebug.tar.gz http://xdebug.org/files/xdebug-2.3.3.tgz && \
tar -xvf /tmp/xdebug.tar.gz -C /tmp && \
rm -f /tmp/xdebug.tar.gz && \
mv /tmp/xdebug-2.3.3 /usr/src/php/ext/xdebug && \
docker-php-ext-install xdebug && \

docker-php-ext-install \
    bcmath \
    bz2 \
    exif \
    ftp \
    gd \
    gettext \
    mbstring \
    mcrypt \
    mysqli \
    opcache \
    pdo_mysql \
    mysql \
    shmop \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    zip

# starting php-fpm
#
CMD ["php-fpm"]