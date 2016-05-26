# PHP Docker Image + Necessary Extensions + Tools

FROM servivum/debian:jessie
MAINTAINER Patrick Baber <patrick.baber@servivum.com>

# Version
# URL: http://nl1.php.net/downloads.php
ENV PHP_VERSION "7.0.7"
ENV PHP_SHA256_CHECKSUM "66282ff4a9f88fe9607d9574e15bf335885b964245591a1740adb3f79c514a67"

# URL: https://getcomposer.org/download/
ENV COMPOSER_VERSION "1.1.1"

# URL: https://phar.phpunit.de/
ENV PHPUNIT_VERSION "5.3.4"
ENV PHPUNIT_SHA256_CHECKSUM "ce354a3722dd40f2af807e6ddc091646b7364b14f639a1fdd077e1c95f8ad859"

# Install build essentials & dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libfcgi-dev \
    libfcgi0ldbl \
    libjpeg62-turbo-dbg \
    libmcrypt-dev \
    libssl-dev \
    libc-client2007e \
    libc-client2007e-dev \
    libxml2-dev \
    libbz2-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libpng12-dev \
    libfreetype6-dev \
    libkrb5-dev \
    libpq-dev \
    libreadline6-dev \
    librecode-dev \
    libxml2-dev \
    libxslt1-dev \
    libmcrypt4 \
    pkg-config \
    graphicsmagick \
    graphicsmagick-imagemagick-compat \
    ghostscript \
    && \
    mkdir -p /usr/src/php && \

# Load and compile PHP
# @TODO: Make /etc/php to default config path
    cd /usr/src/php && \
    wget http://de1.php.net/get/php-${PHP_VERSION}.tar.gz/from/this/mirror -O php-${PHP_VERSION}.tar.gz && \
    openssl sha256 php-${PHP_VERSION}.tar.gz | grep "${PHP_SHA256_CHECKSUM}" && \
    tar -xvzf php-${PHP_VERSION}.tar.gz && \
    cd php-${PHP_VERSION}/ && \
    mkdir -p /usr/local/etc/php/conf.d && \
    ./configure \
    --disable-cgi \
    --enable-fpm \
    --enable-mbstring \
    --enable-mysqlnd \
    --with-config-file-path="/usr/local/etc/php" \
    --with-config-file-scan-dir="/usr/local/etc/php/conf.d" \
    --with-curl \
    --with-gd \
    --with-pdo-mysql \
    --with-mcrypt \
    --with-mysqli \
    --with-openssl \
    --with-readline \
    --with-recode \
    --with-zlib \
    && \
    make && \
    make install && \
    rm -rf /usr/src/php && \

# Clean up
    apt-get purge -y -f \
    build-essential \
    && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Install Composer
RUN wget https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

# Install PHPUnit
RUN wget https://phar.phpunit.de/phpunit-${PHPUNIT_VERSION}.phar && \
    openssl sha256 phpunit-${PHPUNIT_VERSION}.phar | grep "${PHPUNIT_SHA256_CHECKSUM}" && \
    mv phpunit-${PHPUNIT_VERSION}.phar /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit

# Add php-fpm pool config
# @TODO: Use php-fpm.conf from the compiling process and not an own version inside this repo.
COPY etc/php/php-fpm.conf /usr/local/etc/php-fpm.conf

# Add supervisor conf
COPY etc/supervisor/conf.d/php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf

WORKDIR /var/www
EXPOSE 9000
CMD ["/usr/bin/supervisord"]
