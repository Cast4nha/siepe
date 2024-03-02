FROM php:7.4-apache

# PHP extensions

RUN apt-get update && apt-get install -y libpq-dev
WORKDIR /var/www/html
RUN docker-php-ext-install pdo pdo_pgsql pgsql
COPY . /var/www/html/
#COPY ./config/php.ini /usr/local/etc/php/
