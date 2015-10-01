FROM php-cli

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

RUN apt-get update && apt-get install -y \
    curl \
    git \
    vim \
    php5-mcrypt \
    php5-mongo \
    php5-mssql \
    php5-mysqlnd \
    php5-pgsql \
    php5-redis \
    php5-sqlite \
    php5-gd

ENTRYPOINT ["/bin/bash"]