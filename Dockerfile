# Use an official PHP runtime as a parent image
FROM php:8.4-fpm

# Set the working directory
WORKDIR /var/www/html

# Install system dependencies and PHP extensions for Laravel + Postgres
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo_pgsql pgsql zip mbstring bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer files and install dependencies (use Docker cache)
COPY ./webroot/composer.json ./webroot/composer.lock* ./
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Copy application files
COPY ./webroot/ /var/www/html

# Set permissions for Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]