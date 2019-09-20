#!/bin/bash

# list all containers
docker ps -aq 2>/dev/null

# stop all containers
docker stop $(docker ps -aq) 2>/dev/null

# remove all containers
docker rm -f $(docker ps -aq) 2>/dev/null

# remove all images
# docker rmi -f $(docker images -q) 2>/dev/null

# remove all volumes
docker system prune --volumes -f 2>/dev/null

# remove all networks
docker network prune -f 3>/dev/null

