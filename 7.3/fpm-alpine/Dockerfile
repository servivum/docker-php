FROM php:7.3-fpm-alpine
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

# Change UID and GID of www-data user
RUN apk --no-cache add shadow && \
    groupmod -g 101 www-data && \
    usermod -u 100 -g 101 www-data && \
    apk del shadow

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install Composer
COPY --from=composer:1.8 /usr/bin/composer /usr/local/bin/composer