FROM debian:jessie

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

RUN apt-get update && apt-get install -y \
    php5-cli

ENTRYPOINT ["php"]
CMD ["--help"]