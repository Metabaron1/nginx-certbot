#!/bin/sh

/usr/bin/certbot run -n --nginx --agree-tos -m %LETSENCRYPT_EMAIL% -d %MYHOSTNAME% --http-01-port 1080 --https-port 1443

