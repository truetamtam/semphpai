# semphpai
[Docker] (https://docs.docker.com) based php environment. [debian,php-fpm,nginx,mysql(mariadb)]
***

## with phpmyadmin
* download and unzip
* in docker-compose.yml make host for phpmyadmin.dev
* in phpmyadmin dir ./libraries/config.default.php <--- $cfg['Servers'][$i]['host'] = getenv("MYSQL_PORT_3306_TCP_ADDR");