![PHP 7.3](https://img.shields.io/badge/PHP-7.3-brightgreen.svg?style=flat-square) ![PHP 7.2](https://img.shields.io/badge/PHP-7.2-brightgreen.svg?style=flat-square) ![PHP 7.1](https://img.shields.io/badge/PHP-7.1-brightgreen.svg?style=flat-square) ![PHP 7.0](https://img.shields.io/badge/PHP-7.0-brightgreen.svg?style=flat-square) ![PHP 5.6](https://img.shields.io/badge/PHP-5.6-brightgreen.svg?style=flat-square) ![Composer 1.8](https://img.shields.io/badge/Composer-1.8-brightgreen.svg?style=flat-square) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT) [![Travis](https://img.shields.io/travis/servivum/docker-php.svg?style=flat-square)](https://travis-ci.org/servivum/docker-php)

# PHP Docker Image

Dockerfile for creating lightweight PHP images with Composer based on Alpine Linux. See 
[Docker Hub](https://hub.docker.com/r/servivum/php) for more details about the image.

## Supported Tags

- `7.3-cli-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.3/cli-alpine/Dockerfile)
- `7.3-fpm-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.3/fpm-alpine/Dockerfile)
- `7.3-fpm-alpine-common` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.3/fpm-alpine-common/Dockerfile)
- `7.3-fpm-stretch` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.3/fpm-stretch/Dockerfile)
- `7.2-cli-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.2/cli-alpine/Dockerfile)
- `7.2-fpm-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.2/fpm-alpine/Dockerfile)
- `7.2-fpm-alpine-common` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.2/fpm-alpine-common/Dockerfile)
- `7.2-fpm-stretch` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.2/fpm-stretch/Dockerfile)
- `7.1-cli-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.1/cli-alpine/Dockerfile)
- `7.1-fpm-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.1/fpm-alpine/Dockerfile)
- `7.1-fpm-alpine-common` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.1/fpm-alpine-common/Dockerfile)
- `7.1-fpm-stretch` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.1/fpm-stretch/Dockerfile)
- `7.0-cli-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.0/cli-alpine/Dockerfile)
- `7.0-fpm-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.0/fpm-alpine/Dockerfile)
- `7.0-fpm-alpine-common` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.0/fpm-alpine-common/Dockerfile)
- `7.0-fpm-stretch` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/7.0/fpm-stretch/Dockerfile)
- `5.6-cli-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/5.6/cli-alpine/Dockerfile)
- `5.6-cli-stretch` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/5.6/cli-stretch/Dockerfile)
- `5.6-fpm-alpine` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/5.6/fpm-alpine/Dockerfile)
- `5.6-fpm-alpine-common` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/5.6/fpm-alpine-common/Dockerfile)
- `5.6-fpm-stretch` [(Dockerfile)](https://github.com/servivum/docker-php/blob/master/5.6/fpm-stretch/Dockerfile)

## Image Variants

All variants has Composer preinstalled.

### `servivum/php:<version>-cli-<distro>`

This variant contains the PHP CLI tool with default mods. If you need a web server, this is probably not the image you are looking for. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as a base from which to build other images.

### `servivum/php:<version>-fpm-<distro>`

This variant contains PHP-FPM, which is a FastCGI implementation for PHP.

### `servivum/php:<version>-fpm-<distro>-common`

This variant contains PHP-FPM like the variant above but with these preinstalled PHP extensions:

- bcmath
- bz2
- calendar
- iconv
- intl
- gd
- mbstring
- mcrypt (only PHP ≤ 7.1)
- mysqli
- pdo_mysql
- soap
- zip