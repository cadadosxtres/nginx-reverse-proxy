FROM nginx
EXPOSE 80 443

ENV CUSTOM_SERVER=localhost
ENV CUSTOM_CERT_FILE_PATH=/etc/ssl/certs/nginx/cert.crt
ENV CUSTOM_KEY_FILE_PATH=/etc/ssl/certs/nginx/key.key

COPY ./root/etc/nginx/includes/ /etc/nginx/includes/
COPY ./root/etc/nginx/templates /etc/nginx/templates/

