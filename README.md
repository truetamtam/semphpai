# semphpai
Simple docker php environment. [debian,php-fpm,nginx,mysql]

## Usage

```
    $ docker run -itP \  
        -v $PWD:/srv \  
        -e DB_NAME=somedbname \  
        -e INIT=bin/reload \  
        proj/some
```
