# Use an official PHP runtime as a parent image
FROM php:8.4-fpm

WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libonig-dev \
    libzip-dev \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql pgsql zip mbstring bcmath

# Copy composer files from project root
COPY ./webroot/composer.json ./webroot/composer.lock* ./

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader --no-scripts


# Copy Laravel source code
COPY ./webroot/ /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 9000

CMD ["php-fpm"]
