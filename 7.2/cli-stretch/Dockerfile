FROM php:7.2-cli-stretch
LABEL maintainer "Patrick.Baber <patrick.baber@servivum.com>"

# Install PHP Extensions
RUN buildDeps=" \
        default-libmysqlclient-dev \
        libbz2-dev \
        libmemcached-dev \
        libsasl2-dev \
    " \
    runtimeDeps=" \
        curl \
        git \
        imagemagick \
        libmagickwand-dev \
        libfreetype6-dev \
        libicu-dev \
        libgmp-dev \
        libjpeg-dev \
        libldap2-dev \
        libmemcachedutil2 \
        libpng-dev \
        libpq-dev \
        libssh-dev \
        libxml2-dev \
        libxslt1-dev \
    " && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y $buildDeps $runtimeDeps && \
    docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && \
    docker-php-ext-configure ldap \
        --with-libdir=lib/x86_64-linux-gnu/ \
    && \
    docker-php-ext-install \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    gettext \
    gmp \
    iconv \
    intl \
    ldap \
    mbstring \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    soap \
    sockets \
    xsl \
    zip \
    && \
    pecl install \
    apcu \
    imagick \
    memcached \
    redis \
    && \
    docker-php-ext-enable \
    apcu \
    imagick \
    memcached \
    redis \
    && \
    apt-get purge -y --auto-remove $buildDeps && \
    rm -r /var/lib/apt/lists/*

# Install cron
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y cron && \
    rm -r /var/lib/apt/lists/*

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Override with common settings
COPY config/common.ini $PHP_INI_DIR/conf.d/

# Install Composer
COPY --from=composer:1.8 /usr/bin/composer /usr/local/bin/composer