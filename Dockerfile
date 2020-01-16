#ver-2020.01.16.12.52
FROM alpine:latest
MAINTAINER niiv0832 <dockerhubme-3proxy@yahoo.com>


RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
      apk update && \
      apk upgrade && \
      apk add 3proxy && \
      rm -rf /var/cache/apk/* && \
      mkdir -p /etc/3proxy/cfg && \
      mkdir -p /var/log/3proxy 
      
VOLUME ["/etc/3proxy/cfg/"]
VOLUME ["/var/log/3proxy/"]

EXPOSE 7000-7120

CMD /usr/bin/3proxy /etc/3proxy/cfg/3proxy.cfg
