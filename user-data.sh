#!/bin/bash
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    git \
    awscli \
    python3-pip \
    libssl-dev \
    libffi-dev \
    python3-dev \
    jq 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo usermod -aG docker ${USER}
yes | ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
echo "alias dc=docker-compose" >> ~/.bashrc
echo "alias d=docker" >> ~/.bashrc