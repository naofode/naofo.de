naofo.de
========

url shortener which creates a print. for denouncing despicable content without giving it views or pagerank
/
it's all about http://wkhtmltopdf.org/

simple installation guide for ubuntu 14.04
-------------------------------------------

dependencies:

* python
* apache
* php5
* php5-curl
* php5-mysql
* mysql
* wkhtmltoimage
* imagemagick

other requirements:

* recaptcha
* google analytics

steps:

1. add apache variables in `/etc/apache2/envvars`:

    export naofode_recaptchakey='???'
    export naofode_dsn='mysql:host=localhost;dbname=???'
    export naofode_dbuser='???'
    export naofode_dbpass='???'

2. alter recaptcha site key in `index.php`

3. alter analytics javascript in `index.php`

4. create database table:

    mysql> source /path/to/schema.sql

5. along all files, alter occurrences of `naofo.de` to the new domain (be careful not to change github address)

6. alter `<Directory /var/www/>` in `/etc/apache2/apache2.conf`:

    AllowOverride All

7. execute

    mkdir /var/www/html/prints

8. execute

    chown www-data:www-data /var/www/html/prints

9. execute

    a2enmod rewrite

10. execute

    service apache2 restart
