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

1. Rename `.env.example` to `.env`

2. Edit the `.env` with your data

3. create database table:

	mysql> source /path/to/schema.sql

4. alter `<Directory /var/www/>` in `/etc/apache2/apache2.conf`:

	AllowOverride All

5. execute

	chown www-data:www-data /var/www/html/prints

6. execute

	a2enmod rewrite

7. execute

	service apache2 restart

Troubleshooting
--

### xvfb

On a headless server I had to use [xfvb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) as mentioned [here](https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2037#issuecomment-62019521) and [here](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=580226#34).

On a debian based system you have to: `sudo apt-get install xvfb`

Otherwise, the `capture.sh` file should be changed to not use `xvfb`.
