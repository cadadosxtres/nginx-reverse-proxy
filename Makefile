CONTAINER_NAME=cadadosxtres/reverse-proxy
CONTAINER_IMAGE=nginx-proxy
PROXY_PASS ?= "https://10.0.0.1:9999"

up:
	docker-compose up -d proxy
run:
	docker-compose run --name ${CONTAINER_NAME} -p 80:80 -p 443:443 -e 8123:8123 -e CUSTOM_PROXY_URL=${PROXY_PASS} proxy
rm:
	docker rm -f ${CONTAINER_NAME}

exec:
	docker exec -it ${CONTAINER_NAME} /bin/bash

build:
	docker-compose build

clean:
	./scripts/clean.sh

browser:
	google-chrome --incognito http://localhost

create_certificate:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout root/etc/ssl/certs/nginx/key.key -out root/etc/ssl/certs/nginx/cert.crt

freeze_proxy_env:
	git update-index --assume-unchanged proxy.env

unfreeze_proxy_env:
	git update-index --no-assume-unchanged proxy.env

.PHONY: run up exec build clean browser create_certificate freeze_proxy_env unfreeze_proxy_env