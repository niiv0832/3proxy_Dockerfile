FROM alpine:latest
MAINTAINER niiv0832 <dockerhubme-ssr@yahoo.com>


RUN set -ex && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
      apk update && \
      apk upgrade && \
      apk add 3proxy && \
      rm -rf /var/cache/apk/* && \
      mkdir -p /etc/3proxy/cfg/traf
  
VOLUME ["/etc/3proxy/cfg/"]

EXPOSE 80/tcp 81/tcp 82/tcp 83/tcp 84/tcp 85/tcp 86/tcp 87/tcp 88/tcp 89/tcp 90/tcp 91/tcp 92/tcp 93/tcp 94/tcp 95/tcp 96/tcp 97/tcp 98/tcp 99/tcp 100/tcp 101/tcp 102/tcp 103/tcp 104/tcp 105/tcp 106/tcp 107/tcp 108/tcp 109/tcp 110/tcp 111/udp 112/udp 113/udp   

USER nobody

CMD /etc/3proxy/3proxy /etc/3proxy/cfg/3proxy.cfg
