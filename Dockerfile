FROM debian:jessie

MAINTAINER Roman Ulashev <truetamtam@yandex.ru>

ENV DEBIAN_FRONTEND noninteractive

# Install core dependencies
#
RUN apt-get update && apt-get install -y \
        curl \
        wget \
        apt-utils \
        dialog \
        vim \
        git-core \
        supervisor


# Install Nginx
#
RUN apt-get install -y nginx-full

# Add user 'www-data' to administrators
#
RUN usermod -u 1000 www-data

# Forward request and error logs to docker log collector
#
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# no daemon for nginx
#
RUN sed -i -e '1s/^/daemon off;\n\n/' /etc/nginx/nginx.conf

# Install php-fpm
# mysql server
RUN apt-get update && \
    apt-get install -y \
        php5-fpm \
        php5-cli \
        php5-curl \
        php5-gd \
        php5-intl \
        php5-mcrypt \
        php5-pgsql \
        php5-sqlite \
        php5-mysqlnd \
        php5-xdebug \
        mysql-server

# Moving configs to container
# nginx servers config
#
ADD vhost.conf /etc/nginx/sites-enabled/default
# Supervisor config
#
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# php-fpm config
#
ADD www.conf /etc/php5/fpm/pool.d/www.conf

# Install composer
#
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Add running sh on start
#
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80 9000

# Create app folder
#
RUN mkdir app
RUN chown www-data:www-data /app

# Mount folder
#
VOLUME ["/app"]
WORKDIR /app

CMD ["/run.sh"]