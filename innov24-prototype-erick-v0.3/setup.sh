#!/bin/bash

# Build Innov24
echo "This script is going to build innov24 on your computer"
echo "This script is going to erase all previous configuration"
echo "CTRL+C now if you want to stop"
sleep 5

sudo docker system prune -af >/dev/null 2>&1
sudo apt-get remove docker docker-engine docker.io containerd runc >/dev/null 2>&1
sudo apt-get autoremove -y &&

# x86_64 architecture
sudo apt-get install -y python3 python3-pip &&
sudo apt-get update &&
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common &&
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&
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
sudo bash -c "source ./config && docker-compose up -d"

echo -ne "
Connect to https://$INNOV24_IDENTITY_IP:$INNOV24_IDENTITY_PORT_SECURE to access SSO secure
Connect to https://$INNOV24_IDENTITY_IP:$INNOV24_IDENTITY_PORT_UNSECURE to access SSO unsecure
Connect to http://$INNOV24_SOCIALNETWORK_IP:$INNOV24_SOCIALNETWORK_PORT to access innov24 Social Network
Connect to http://$INNOV24_MARKETPLACE_IP:$INNOV24_MARKETPLACE_PORT to access innov24 Marketplace
Connect to http://$INNOV24_MARKETPLACE_PHPMYADMIN_IP:$INNOV24_MARKETPLACE_PHPMYADMIN_PORT to access magento phpmyadmin
--------------------------------
Connect to $INNOV24_IDENTITY_ANALYTICS_WORKERS_IP:$INNOV24_IDENTITY_ANALYTICS_WORKER1_PORT to access SSO analytics worker 1
Connect to $INNOV24_IDENTITY_ANALYTICS_WORKERS_IP:$INNOV24_IDENTITY_ANALYTICS_WORKER2_PORT to access SSO analytics worker 2
Connect to $INNOV24_IDENTITY_ANALYTICS_DASHBOARD_IP:$INNOV24_IDENTITY_ANALYTICS_DASHBOARD_PORT to access SSO analytics dashboard
Connect to $INNOV24_MARKETPLACE_MYSQL_IP:$INNOV24_MARKETPLACE_MYSQL_PORT to access magento mysql server
\n"
