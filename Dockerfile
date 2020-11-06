FROM nginx:alpine

EXPOSE 1080 1443
#VOLUME /etc/letsencrypt
#VOLUME /etc/nginx

RUN apk add --update --no-cache certbot certbot-nginx

RUN mkdir /scripts
ADD generate_config.sh /scripts
ADD templates/certbot.sh /scripts
ADD templates/simplelogin.conf /etc/nginx/conf.d/simplelogin.conf

RUN chown -R nginx:nginx /scripts /etc/nginx/conf.d /var/cache/nginx && \
    chmod a+x /scripts/generate_config.sh /scripts/certbot.sh && \
    rm -f /etc/nginx/conf.d/default.conf && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/run/nginx.pid

ADD files/index.html /usr/share/nginx/html
ADD files/certs/ssl-cert-snakeoil.key /etc/ssl/private/ssl-cert-snakeoil.key
ADD files/certs/ssl-cert-snakeoil.pem /etc/ssl/ssl-cert-snakeoil.pem
RUN mkdir                /var/log/letsencrypt /var/lib/letsencrypt && \
    chown -R nginx:nginx /var/log/letsencrypt /var/lib/letsencrypt /etc/nginx 
RUN ln -s /dev/stdout /var/log/letsencrypt/letsencrypt.log

#Disable warning: "user" directive makes sense only if the master process runs with super-user privileges
RUN sed -i "s/^\s*user\s\s*nginx;/#user nginx;/g" /etc/nginx/nginx.conf
USER nginx
CMD /scripts/startup.sh
