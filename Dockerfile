# PHP Docker Image + Necessary Extensions + Tools

FROM php:7.0-fpm
MAINTAINER Patrick Baber <patrick.baber@servivum.com>

# Install extensions and ssmtp
RUN apt-get update && apt-get install -y \
	ssmtp \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Modify ssmtp settings
#RUN sed -ri -e 's/^(mailhub=).*/\1smtp-server/' \
#-e 's/^#(FromLineOverride)/\1/' /etc/ssmtp/ssmtp.conf

# Alternative command for ssmtp
#RUN echo "Mailhub=smtp" > /etc/ssmtp/ssmtp.conf && \
#    echo "FromLineOverride=Yes" >> /etc/ssmtp/ssmtp.conf

# Update package index
# RUN apt-get update

# Install APC (Beta)
#RUN pecl install apcu-beta
#RUN echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini

# Install bcmath
#RUN docker-php-ext-install bcmath

# Install bz2
#RUN apt-get install -y libbz2-dev
#RUN docker-php-ext-install bz2

# Install calendar
#RUN docker-php-ext-install calendar

# Install dba
#RUN docker-php-ext-install dba

# Install GD
#RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
#RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
#RUN docker-php-ext-install gd

# Install gettext
#RUN docker-php-ext-install gettext

# Install iconv
#RUN docker-php-ext-install iconv

# Install mbstring
#RUN docker-php-ext-install mbstring

# Install mcrypt
#RUN apt-get install -y libmcrypt-dev
#RUN docker-php-ext-install mcrypt

# Install mysqli
#RUN docker-php-ext-install mysqli

# Install PDO
#RUN docker-php-ext-install pdo_mysql
#RUN apt-get install -y libsqlite3-dev
#RUN docker-php-ext-install pdo_sqlite

# Install XSL
#RUN apt-get install -y libxslt-dev
#RUN docker-php-ext-install xsl

# Install xmlrpc
#RUN docker-php-ext-install xmlrpc

# Install Zip
#RUN docker-php-ext-install zip

CMD ["php-fpm"]