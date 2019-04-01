FROM php:5.6-cli-stretch
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install Composer
COPY --from=composer:1.8 /usr/bin/composer /usr/local/bin/composer