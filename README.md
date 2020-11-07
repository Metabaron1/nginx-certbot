# Docker Image for SimpleLogin Nginx

Nginx image running as non-root user 'nginx', with Certbot certificate update, tailor-made for [SimpleLogin](https://simplelogin.io/).

The Chicken or the Egg?

There is a tricky part runing cerbot within nginx container:
Nginx is needed to perform the Let’s Encrypt validation, but nginx won’t start if the certificates are missing... => initial startup without ssl and reload with ssl after certificates generation 
