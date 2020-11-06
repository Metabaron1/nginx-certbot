# Docker Image for SimpleLogin Nginx

Nginx image with Certbot certificate update, tailor-made for [SimpleLogin](https://simplelogin.io/).

The Chicken or the Egg?
There is a tricky part runing cerbot within ngonx conainer:
Nginx is needed to perform the Let’s Encrypt validation But nginx won’t start if the certificates are missing... 
