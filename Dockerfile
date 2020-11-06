FROM nginx:alpine

EXPOSE 8000 8443
#VOLUME /etc/letsencrypt
#VOLUME /etc/nginx

RUN apk add --update --no-cache certbot certbot-nginx

ADD scripts/ /scripts/
ADD templates/simplelogin.conf /etc/nginx/conf.d/simplelogin.conf
ADD files/index.html /usr/share/nginx/html
ADD files/certs/ssl-cert-snakeoil.key /etc/ssl/private/ssl-cert-snakeoil.key
ADD files/certs/ssl-cert-snakeoil.pem /etc/ssl/ssl-cert-snakeoil.pem

RUN rm -f /etc/nginx/conf.d/default.conf && \
    chmod a+x /scripts/* && \
    touch                /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /scripts /etc/nginx /var/cache/nginx 

RUN mkdir                /var/log/letsencrypt /var/lib/letsencrypt && \
    chown -R nginx:nginx /var/log/letsencrypt /var/lib/letsencrypt  

USER nginx
#Remove "user" directive to disable warning as nginx user: "user" directive makes sense only if the master process runs with super-user privileges
RUN sed -i "s/^\s*user\s\s*nginx;/#user nginx;/g" /etc/nginx/nginx.conf

CMD /scripts/startup.sh
