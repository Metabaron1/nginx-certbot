#!/bin/sh

TEMPLATE="$1"

if [ -z "$MYDOMAIN" ] ; then
  MYDOMAIN="mydomain.com"
fi

if [ -z "$MYHOSTNAME" ] ; then
  MYHOSTNAME="app.$MYDOMAIN"
fi

if [ -z "$LETSENCRYPT_EMAIL" ] ; then
  LETSENCRYPT_EMAIL="support@$MYDOMAIN"
fi

sed -i "s|%MYDOMAIN%|$MYDOMAIN|g"			$TEMPLATE
sed -i "s|%MYHOSTNAME%|$MYHOSTNAME|g"			$TEMPLATE
sed -i "s|%LETSENCRYPT_EMAIL%|$LETSENCRYPT_EMAIL|g"	$TEMPLATE
sed -i "s|%REDIRECT_HOST%|$REDIRECT_HOST|g"             $TEMPLATE

#Remove redirect nginx directive if REDIRECT_HOST not defined
if [ -z "$REDIRECT_HOST" ] ; then
  sed -i "s|\(\s\s*return 301\s\s*.*\)||g"              $TEMPLATE 
fi

