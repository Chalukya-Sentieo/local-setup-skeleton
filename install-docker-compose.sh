#!/bin/bash
dc=$(command -v docker-compose 2>&1)
dcv=$(docker-compose -v 2>&1)
printf "\n\n\n$dcv\n\n"

if [ -z "$dc" ] || [[ "$dcv"  != *v2.2.3 ]] ;
    then
        echo "Installing docker-compose v2.2.3"
        sudo bash -c \
            "mkdir -p /usr/local/lib/docker/cli-plugins &&\
            rm -f /usr/local/lib/docker/cli-plugins/docker-compose &&\
            curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose &&\
            chmod +x /usr/local/lib/docker/cli-plugins/docker-compose &&\
            ln -sf /usr/local/lib/docker/cli-plugins/docker-compose /usr/bin/docker-compose"
fi
docker-compose down -v
