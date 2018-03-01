FROM php:5.6-cli-alpine
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

ENV COMPOSER_VERSION "1.6.3"
ENV COMPOSER_SHA256_HASH "52cb7bbbaee720471e3b34c8ae6db53a38f0b759c06078a80080db739e4dcab6"

# Install Composer
RUN wget https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    openssl sha256 composer.phar | grep "${COMPOSER_SHA256_HASH}" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

# Create project root
RUN mkdir -p /var/www

# Change work directory to project root
WORKDIR /var/www