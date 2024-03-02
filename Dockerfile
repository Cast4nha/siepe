FROM php:5.6-apache

# PHP extensions
COPY ./apt /etc/apt
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
WORKDIR /var/www/html/

COPY . /var/www/html/
COPY ./config/php.ini /usr/local/etc/php/
