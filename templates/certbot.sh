#!/bin/sh

/usr/bin/certbot run --non-interactive --nginx --agree-tos --no-redirect -m %LETSENCRYPT_EMAIL% -d %MYHOSTNAME% --http-01-port 8000 --https-port 8443
sed -i "s/listen 8444;//g" /etc/nginx/conf.d/simplelogin.conf
/usr/sbin/nginx -c /etc/nginx/nginx.conf -t
/usr/sbin/nginx -s reload
