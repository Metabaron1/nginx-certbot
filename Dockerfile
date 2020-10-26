FROM nginx:alpine

EXPOSE 1080 1443
#VOLUME /etc/letsencrypt
#VOLUME /etc/nginx

RUN apk add --update --no-cache certbot certbot-nginx

ADD generate_config.sh /bin
ADD templates/simplelogin.conf /etc/nginx/conf.d/simplelogin.conf

CMD ./generate_config.sh --certbot && /usr/sbin/nginx -g daemon
