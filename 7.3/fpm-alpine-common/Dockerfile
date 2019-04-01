FROM php:7.3-fpm-alpine
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

# Change UID and GID of www-data user
RUN apk --no-cache add shadow && \
    groupmod -g 101 www-data && \
    usermod -u 100 -g 101 www-data && \
    apk del shadow

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
        imagemagick \
        libjpeg-turbo-dev \
        libldap \
        libpng-dev \
        libxml2-dev \
        libzip-dev \
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
    mysqli \
    opcache \
    pdo_mysql \
    soap \
    && \
    docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && \
    docker-php-ext-configure zip --with-libzip && \
    docker-php-ext-install gd && \
    docker-php-ext-install exif && \
    docker-php-ext-install zip && \
    apk del $buildDeps

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Override with common settings
COPY config/common.ini $PHP_INI_DIR/conf.d/

# Install Composer
COPY --from=composer:1.8 /usr/bin/composer /usr/local/bin/composer