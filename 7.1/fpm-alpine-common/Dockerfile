FROM php:7.1-fpm-alpine
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

ENV COMPOSER_VERSION "1.8.3"
ENV COMPOSER_SHA256_HASH "5733ae9516e9185b7c3328d16dac75f3475f8ef137572dfb497f0f298157df33"

# Install PHP Extensions
RUN buildDeps=" \
        bzip2-dev \
        libsasl \
    " \
    runtimeDeps=" \
        curl \
        git \
        freetype-dev \
        icu-dev \
        libjpeg-turbo-dev \
        libldap \
        libmcrypt-dev \
        libpng-dev \
        libxml2-dev \
        zlib-dev \
    " && \
    apk add --no-cache $buildDeps $runtimeDeps && \
    docker-php-ext-install \
    bcmath \
    bz2 \
    calendar \
    iconv \
    intl \
    mbstring \
    mcrypt \
    mysqli \
    opcache \
    pdo_mysql \
    soap \
    zip \
    && \
    docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && \
    docker-php-ext-install gd && \
    docker-php-ext-install exif && \
    apk del $buildDeps

# Install Composer
RUN wget https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    openssl sha256 composer.phar | grep "${COMPOSER_SHA256_HASH}" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer