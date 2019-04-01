FROM php:7.2-fpm-stretch
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Override with common settings
COPY config/common.ini $PHP_INI_DIR/conf.d/

# Install Composer
COPY --from=composer:1.8 /usr/bin/composer /usr/local/bin/composer