#!/bin/bash

#list all containers
docker ps -aq

#stop all containers
docker stop $(docker ps -aq)

#remove all containers
docker rm $(docker ps -aq)

#remove all images
docker rmi $(docker images -q)

#remove
#- all stopped containers
#- all networks not used by at least one container
#- all dangling images
#- all build cache
docker system prune -f

