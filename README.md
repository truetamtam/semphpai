# semphpai
Simple docker php environment. [debian,php-fpm,nginx,mysql]
***

* [install docker] (https://docs.docker.com/installation/debian/)
* cd semphpai && docker build -t semphpai .

## Usage
```
cd app  

$ docker run -itd \  
    -p 8000:80 \  
    -v $PWD:/app \  
    -e DB_NAME=somedbname \  
    semphpai  
```
