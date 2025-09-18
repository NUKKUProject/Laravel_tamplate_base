#!/bin/bash
set -e

echo "Starting containers..."
docker compose up -d

echo "Installing dependencies and running migrations..."
docker compose exec app composer install --no-interaction --prefer-dist --optimize-autoloader
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate --force

echo "Setup completed!"
