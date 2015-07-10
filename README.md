# semphpai
Simple docker php environment. [debian,php-fpm,nginx,mysql]
***

## Usage

```
cd app

$ docker run -itd \  
    -p 8000:80 \  
    -v $PWD:/srv \  
    -e DB_NAME=somedbname \  
    app/name
```
