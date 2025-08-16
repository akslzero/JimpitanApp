FROM php:8.3-cli

# Install dependencies untuk intl dan zip
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libicu-dev \
    unzip \
    && docker-php-ext-install intl zip

# Copy source code ke dalam container (opsional)
WORKDIR /app
COPY . .

# Jalankan perintah composer jika perlu
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

CMD ["php", "-a"]
