# semphpai
[Docker] (https://docs.docker.com/installation/debian/) based php environment. [debian,php-fpm,nginx,mysql]
***

## Setup
* build - "cd semphpai && docker build -t semphpai"

## Usage

```
cd app  

$ docker run -itd \  
    --name proj \  
    -p 8000:80 \  
    -v $PWD:/app \  
    -e DB_NAME=somedbname \  
    semphpai  
```

## docker "run" opts
nginx configuration

```
    -v $PWD/docker/nginx/:/etc/nginx/sites-available/
```

and  

```
    docker proj restart
```