FROM ubuntu:trusty

RUN \
  echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" > /etc/apt/sources.list.d/nginx-stable-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

ADD nginx.conf.template /etc/nginx/nginx.conf.template
ADD docker-registry.conf /etc/nginx/docker-registry.conf
ADD dockerize /usr/bin/dockerize

VOLUME ["/srv/config"]

WORKDIR /etc/nginx

EXPOSE 80
EXPOSE 443

CMD /usr/bin/dockerize -template /etc/nginx/nginx.conf.template:/etc/nginx/nginx.conf -stdout /var/log/nginx/access.log -stderr /var/log/nginx/error.log nginx
