FROM php:8.3-cli

# Install dependencies untuk intl dan zip
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libicu-dev \
    unzip \
    && docker-php-ext-install intl zip
    
RUN docker-php-ext-install pdo pdo_mysql    


# Copy source code ke dalam container (opsional)
WORKDIR /app
COPY . .

EXPOSE 8000

# Jalankan perintah composer jika perlu
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

RUN composer require filament/filament:"^3.3" -W

RUN php artisan filament:install --panels

CMD php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=8000
