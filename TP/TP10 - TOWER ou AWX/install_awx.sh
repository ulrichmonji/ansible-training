#!/bin/bash
sudo yum install git -y
git clone https://github.com/diranetafen/cursus-devops.git
cd ./cursus-devops/tower/
tar -xzvf awx.tar.gz -C ~/
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker vagrant
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose  -f /home/vagrant/.awx/awxcompose/docker-compose.yml up -d
