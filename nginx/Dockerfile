FROM nginx:1.9.5

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

# nginx config distr
#
RUN apt-get update && apt-get install -y \
    # js is for parsing json from docker env
    #
    jq && \
    # copying nginx configs to distr
    #
    cp -r /etc/nginx/ /etc/nginx_dist

# env2servers bash script
#
COPY server.sh /

# checking nginx conf presence
# executing env2servers
#
CMD (test -f /etc/nginx/nginx.conf || cp -a /etc/nginx_dist/* /etc/nginx/) && \
    /bin/bash server.sh && \
    nginx -g "daemon off;"
