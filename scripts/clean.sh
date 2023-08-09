#!/bin/bash

docker ps -a --format '{{.ID}}' | xargs -I {} docker rm -f {}
docker image ls | grep cadadosxtres | awk '{print $3}' | xargs -I {} docker rmi -f {}
sudo rm -f root/var/log/nginx/*