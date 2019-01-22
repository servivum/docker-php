FROM php:5.6-cli-alpine
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

ENV COMPOSER_VERSION "1.8.0"
ENV COMPOSER_SHA256_HASH "0901a84d56f6d6ae8f8b96b0c131d4f51ccaf169d491813d2bcedf2a6e4cefa6"

# Install Composer
RUN wget https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    openssl sha256 composer.phar | grep "${COMPOSER_SHA256_HASH}" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer