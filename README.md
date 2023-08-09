NGINX REVERSE PROXY
=====

A docker nginx image to run a reverse proxy with SSL


HOW-TO
-------


HOW-TO YOUR OWN CERT AND KEY
----------------------------
* if you want to create your own cert and key just execute macro ```make create_certificate```
* Otherwise place your cert and key files in [root/etc/ssl/certs/nginx](root/etc/ssl/certs/nginx)


HOW TO RUN
----------
* Create a certificate by executing ```make create_certificate```
* Set up varialbe CUSTOM_PROXY_URL with your nginx proxy_pass value in file proxy.env
* Execute ```make run PROXY_PASS="https://192.168.1.130:8123"```

HOW TO RUN AS SERVICE
---------------------
* Create a certificate by executing ```make create_certificate```
* Set up varialbe CUSTOM_PROXY_URL with your nginx proxy_pass value in file proxy.env
* Execute ```make up```
