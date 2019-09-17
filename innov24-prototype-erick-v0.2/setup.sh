#!/bin/bash

# Build Innov24
echo "This script is going to build innov24 on your computer"
echo "This script is going to erase all previous configuration"
echo "CTRL+C now if you want to stop"
sleep 5

sudo -k
source ./config &&
sudo docker system prune -af &&

# x86_64 architecture
sudo apt-get install -y python3 python3-pip &&
sudo apt-get remove docker docker-engine docker.io containerd runc &&
sudo apt-get update &&
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&
sudo apt-key fingerprint 0EBFCD88 &&
echo "Should have shown this public key :"
echo "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" &&
sudo apt-get update &&
sudo apt-get install -y docker-ce docker-ce-cli containerd.io &&

sudo pip3 install docker-compose &&
docker-compose up -d &&

echo -ne "
Connect to 10.24.2.2 to access drupal\n
Connect to 10.24.4.2 to access magento\n
"
