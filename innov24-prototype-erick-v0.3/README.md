# Innov24

## How to build?

```
# On x86_64 architecture
sudo apt-get install python3
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
# Should show this public key : 
# 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

pip3 install docker-compose
docker-compose up -d
```

## How to use?

Connect to 10.24.2.2 to access drupal
Connect to 10.24.4.2 to access magento
