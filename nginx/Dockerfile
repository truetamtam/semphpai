FROM nginx

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

# nginx config distr
RUN apt-get update && apt-get install -y \
    jq && \
    cp -r /etc/nginx/ /etc/nginx_dist

COPY nginx.conf /etc/nginx/
COPY server.sh /
#COPY example.dev.conf /etc/nginx/conf.d/

# no conf copying(data container related)
CMD (test -f /etc/nginx/nginx.conf || cp -a /etc/nginx_dist/* /etc/nginx/) && \
    /bin/bash server.sh && \
    nginx -g "daemon off;"
