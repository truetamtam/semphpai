FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# Install nginx
# php-fpm
# mysql
# supervisor
RUN apt-get update -y
RUN apt-get install -y nginx php5-fpm php5-mysqlnd php5-cli mysql-server supervisor

# php-fpm configuration
RUN sed -e 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
RUN sed -e 's/;listen\.owner/listen.owner/' -i /etc/php5/fpm/pool.d/www.conf
RUN sed -e 's/;listen\.group/listen.group/' -i /etc/php5/fpm/pool.d/www.conf
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# nginx conf 2container
ADD vhost.conf /etc/nginx/sites-available/default
# supervisor conf 2container
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
# init.sh 2container
ADD init.sh /init.sh
RUN chmod 755 /init.sh

EXPOSE 80

# Mount folder
VOLUME ["/app"]
WORKDIR /app

# Launching supervisor daemon
CMD ["/usr/bin/supervisord"]