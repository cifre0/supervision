#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

### Install using the repository
### Set up the repository
apt-get install -y ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

### Install Docker Engine
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
VERSION_STRING=$(apt-cache madison docker-ce | cut -d"|" -f2 | head -n1)
apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-compose-plugin

### add docker to root
USER="ubuntu"
groupadd docker
usermod -aG docker $USER
newgrp docker

### enable docker
systemctl enable docker.service
systemctl enable containerd.service
