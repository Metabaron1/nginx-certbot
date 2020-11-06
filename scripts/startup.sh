#!/bin/sh

/scripts/generate_config.sh /etc/nginx/conf.d/simplelogin.conf
/scripts/generate_config.sh /scripts/certbot.sh
nginx -g "daemon off;" &
sleep 5
/scripts/certbot.sh
wait
