FROM nginx

MAINTAINER Roman Ulashev "truetamtam@yandex.ru"

COPY server.template /etc/nginx/sites-available/example.dev

#RUN ["sed", "-i", "-e" "'s/user nginx;/user www-data;/'", "/etc/nginx/nginx.conf"]

RUN ln -s /etc/nginx/sites-enabled/ /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]
