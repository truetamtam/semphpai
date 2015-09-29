#!/usr/bin/env bash

block="server {
    listen 80;
    server_name $1;
    root $2;
    index index.html index.htm index.php;
    charset utf-8;
    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }
    access_log off;
    error_log  /var/log/nginx/$1-error.log error;
    error_page 404 /index.php;
    sendfile off;
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        # include fastcgi_params;
        include fastcgi.conf;
    }
    location ~ /\.ht {
        deny all;
    }
}
"

function genconf() {
    echo "host: $1"
    echo "to: $2"
}

SAMPLE='[{"map": "some.dev", "to": "/some/path"}, {"map": "another.dev", "to": "/another/path"}]'

SITES=($(echo $SAMPLE | jq -r '.[] | .["map"] + "\n" + .["to"]'))

echo "=============="
echo ${SITES[@]}
echo "=============="

SLICED=()
SITES_SIZE=${#SITES[@]}
CNT_MAX=$(($SITES_SIZE/2))
CNT=0

for((n=0;n<=${CNT_MAX};n=$((n+2))));do
    TMP=("${SITES[@]:n:2}")
    genconf ${TMP[0]} ${TMP[1]}
done



#for site in ${SITES}; do
#    $SLICED+=()
#    if ( CNT -le ${CNT_MAX} ); then ${CNT}=0; fi
#    ${CNT}++
#    echo $site
#done

#while IFS=':' read -ra ADDR; do
#    for s in "${ADDR[@]}"; do
#        echo $s
#    done
#done <<< "$SITES"

#echo "$block" > "/etc/nginx/conf.d/$1"
#service nginx restart