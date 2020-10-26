FROM nginx:alpine

EXPOSE 80 443
#VOLUME /etc/letsencrypt
#VOLUME /etc/nginx

RUN apk add --update --no-cache certbot certbot-nginx

#ADD templates/simplelogin.conf /etc/nginx/conf.d/simplelogin.conf

