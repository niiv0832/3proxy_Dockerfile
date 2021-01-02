#ver-2021.01.02.17.06
FROM alpine:edge
MAINTAINER niiv0832 <dockerhubme-3proxy@yahoo.com>
RUN \
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
      apk add --no-cache --update 3proxy && \
      rm -rf /var/cache/apk/* && \
      mkdir -p /etc/3proxy/cfg && \
      mkdir -p /var/log/3proxy && \
      rm -rf /var/cache/apk/*      
VOLUME ["/etc/3proxy/cfg/"]
VOLUME ["/var/log/3proxy/"]
EXPOSE 7000-7120
CMD /usr/bin/3proxy /etc/3proxy/cfg/3proxy.cfg
