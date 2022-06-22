#!/bin/bash

echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo usermod -a -G docker $USER
newgrp docker


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


