FROM php:7.3-fpm-alpine
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

ENV COMPOSER_VERSION "1.8.3"
ENV COMPOSER_SHA256_HASH "5733ae9516e9185b7c3328d16dac75f3475f8ef137572dfb497f0f298157df33"

# Install Composer
RUN wget https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    openssl sha256 composer.phar | grep "${COMPOSER_SHA256_HASH}" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer