FROM php:8.5-cli-alpine3.22

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /scaffolder
COPY . .
RUN composer install --no-dev --classmap-authoritative

WORKDIR /project
ENTRYPOINT ["php", "/scaffolder/src/run.php"]
