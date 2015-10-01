#!/usr/bin/env bash

# env2servers
# Description: generating nginx virtula host configs from docker environmet.
# 1. Creating nginx formated configs in NGINX_CONF_DIR on startup.
# 2. Created configs are not recreated on container restart.
# 3. Delete cofig and restart to recreate them.
#
NGINX_CONF_DIR="/etc/nginx/conf.d"

# for tests -del
#NGINX_CONF_DIR="./tests"

# example is in vhost.conf
function setconfig() {

    block="server {\n
        \tlisten 80;\n
        \tserver_name $1;\n
        \troot $2;\n
        \tindex index.html index.htm index.php;\n
        \tcharset utf-8;\n\n

        \tclient_max_body_size 5m;
        \tclient_body_timeout 180s;

        \tlocation / {\n
            \t\ttry_files \$uri \$uri/ /index.php?\$query_string;\n
        \t}\n
        \tlocation = /favicon.ico { access_log off; log_not_found off; }\n
        \tlocation = /robots.txt  { access_log off; log_not_found off; }\n\n

        \taccess_log off;\n
        \terror_log  /var/log/nginx/$1-error.log error;\n
        \terror_page 404 /index.php;\n
        \tsendfile off;\n\n

        \tlocation ~ \.php$ {\n
            \t\tfastcgi_split_path_info ^(.+\.php)(/.+)$;\n
            \t\tfastcgi_pass php-fpm:9000;\n
            \t\tfastcgi_index index.php;\n
            \t\tfastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;\n
            \t\tfastcgi_param SCRIPT_NAME \$fastcgi_script_name;\n
            \t\tinclude fastcgi_params;\n
            \t\t # include fastcgi.conf;\n
        \t}\n\n

        \tlocation ~ /\.ht {\n
            \t\tdeny all;\n
        \t}\n}"

    # $1 - hostname
    # $2 - map to folder
    echo "host: $1"
    echo "to: $2"
    echo -e ${block} >> "${NGINX_CONF_DIR}/$1.conf"
}

SITES_TR=$(echo ${sites} | tr "'" "\"")
SITES=($(echo ${SITES_TR} | jq -r '.[] | .["map"] + "\n" + .["to"]'))

#SLICED=()
SITES_SIZE=${#SITES[@]}
# del by 2 because of pairs map:to
CNT_MAX=$(($SITES_SIZE/2))
CNT=0

for((n=0;n<=${CNT_MAX};n=$((n+2))));do
    TMP=("${SITES[@]:n:2}")
    # no server directory? Creating.
    if [[ ! -d "${TMP[1]}" ]]; then
        echo "creating: ${TMP[1]}"
        mkdir -p "${TMP[1]}"
        chown www-data:www-data "${TMP[1]}"
    fi
    # Skipping if config already exists.
    if [[ -e ${NGINX_CONF_DIR}/${TMP[0]}.conf ]]; then
        echo "skipping ${TMP[0]}.conf, already exists"
        continue
    fi
    setconfig ${TMP[0]} ${TMP[1]}
done