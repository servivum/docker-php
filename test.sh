#!/bin/bash
set -ev

echo "Building images…"
docker-compose -f docker-compose.build.yml build --no-cache --pull

#echo "Running containers…"
#docker run -d -P --name php php

#echo "Waiting some time, because the process manager inside the container runs async to the docker run command…"
#sleep 10

#echo "Checking if container is running…"
#docker ps | grep php

#echo "Checking existence of some binaries and packages…"
#docker exec php which php
#docker exec php which php-fpm
#docker exec php ps aux | grep php-fpm
#docker exec php which composer