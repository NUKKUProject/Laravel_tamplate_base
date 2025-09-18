# Use an official PHP runtime as a parent image
FROM php:8.4-fpm

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libonig-dev \
    libzip-dev \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql zip mbstring bcmath

COPY ./webroot/composer.json ./webroot/composer.lock* ./

COPY ./webroot/ /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --no-interaction --prefer-dist --optimize-autoloader

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]