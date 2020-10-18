FROM nginx:alpine

EXPOSE 80 443
VOLUME /etc/letsencrypt
#VOLUME /etc/nginx

RUN apk add --update --no-cache python3 python3-dev build-base libressl-dev musl-dev libffi-dev

# Install Python dependencies.
RUN python3 -m ensurepip

RUN pip3 install pip --upgrade
RUN pip3 install certbot-nginx

ADD templates/simplelogin.conf /etc/nginx/conf.d/simplelogin.conf

