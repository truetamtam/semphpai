FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# Install core dependencies
RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        apt-utils \
        dialog \
        vim-tiny \
        git-core \
        supervisor


# Install Nginx
RUN apt-get install -y nginx

# Add user 'www-data' to administrators
RUN usermod -u 1000 www-data

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
        mysql-server

# Moving configs to container
# nginx servers config
ADD vhost.conf /etc/nginx/sites-enabled/default
# Supervisor config
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# php-fpm config
ADD www.conf /etc/php5/fpm/pool.d/www.conf

# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Add running sh on start
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80

# Create app folder
RUN mkdir app
RUN chown www-data:www-data /app

# Mount folder
VOLUME ["/app"]
WORKDIR /app

CMD ["/run.sh"]