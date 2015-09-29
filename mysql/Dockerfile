FROM mysql

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

# copying config dir
RUN chown -R 1000:1000 /etc/mysql && cp -r /etc/mysql /etc/mysql_dist

ENTRYPOINT []

CMD (test -f /etc/mysql/my.cnf || cp -a /etc/mysql_dist/* /etc/mysql/) && bash /entrypoint.sh mysqld

