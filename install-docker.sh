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
