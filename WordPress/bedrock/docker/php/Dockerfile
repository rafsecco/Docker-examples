FROM php:8.3-fpm AS builder

ARG PROJECT_NAME=wp-test

RUN echo "PROJECT_NAME is ${PROJECT_NAME}"

RUN apt-get update && apt-get install -y \
    git unzip zip curl \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql mysqli zip

COPY docker/php/composer-installer.sh /tmp/
RUN chmod +x /tmp/composer-installer.sh && /tmp/composer-installer.sh

# Copia o projeto Bedrock
WORKDIR /var/www/html
COPY ./${PROJECT_NAME}/ /var/www/html/

# Instala dependências do Bedrock
RUN composer install --no-dev --optimize-autoloader

# --- Fase 2: Runtime ---
FROM php:8.3-fpm

COPY --from=builder /usr/local/lib/php/extensions /usr/local/lib/php/extensions
COPY --from=builder /usr/local/etc/php/conf.d /usr/local/etc/php/conf.d
COPY --from=builder /var/www/html /var/www/html
COPY docker/php/php.ini /usr/local/etc/php/

WORKDIR /var/www/html
# RUN chown -R www-data:www-data /var/www/html
