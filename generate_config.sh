#!/bin/sh

NGINX_CONF="/etc/nginx/conf.d/simplelogin.conf"

if [ -z "$MYHOSTNAME" ] ; then
  MYHOSTNAME="app.mydomain.com"
fi

sed -i "s/%MYHOSTNAME%/$MYHOSTNAME/g" $NGINX_CONF
