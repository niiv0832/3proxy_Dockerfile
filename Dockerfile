FROM alpine:latest
MAINTAINER niiv0832 <dockerhubme-3proxy@yahoo.com>


RUN set -ex && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
      echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
      apk update && \
      apk upgrade && \
      apk add 3proxy \
              gzip && \
      rm -rf /var/cache/apk/* && \
      mkdir -p /etc/3proxy/traf && \
      mkdir -p /etc/3proxy/cfg && \
      mkdir -p /var/log/3proxy 
  
VOLUME ["/etc/3proxy/traf/"]
VOLUME ["/etc/3proxy/cfg/"]
VOLUME ["/var/log/3proxy/"]

EXPOSE 80-120

USER nobody

CMD /etc/3proxy/3proxy /etc/3proxy/cfg/3proxy.cfg
