FROM nginx:alpine

EXPOSE 1080 1443
#VOLUME /etc/letsencrypt
#VOLUME /etc/nginx

RUN apk add --update --no-cache certbot certbot-nginx

ADD generate_config.sh /
ADD templates/simplelogin.conf /etc/nginx/conf.d/simplelogin.conf
RUN chown -R nginx:nginx /etc/nginx/conf.d /var/cache/nginx && chmod a+x /generate_config.sh && rm -f /etc/nginx/conf.d/default.conf
USER nginx
CMD /generate_config.sh && nginx -g "daemon off;"
