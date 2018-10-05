FROM php:7.1-fpm-alpine
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

ENV COMPOSER_VERSION "1.7.2"
ENV COMPOSER_SHA256_HASH "ec3428d049ae8877f7d102c2ee050dbd51a160fc2dde323f3e126a3b3846750e"

# Install Composer
RUN wget https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    openssl sha256 composer.phar | grep "${COMPOSER_SHA256_HASH}" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer