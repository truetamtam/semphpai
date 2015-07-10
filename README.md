# semphpai
Simple docker php environment. [debian,php-fpm,nginx,mysql]
***

## Usage

```
    $ docker run -itd \  
        -p 8000:80 \  
        -v $PWD:/srv \  
        -e DB_NAME=somedbname \  
        proj/some
```
