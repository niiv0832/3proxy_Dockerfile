#ver-2021.05.10.xx.xx
#3PROXY_VERSION 0.9.3

FROM alpine:edge
MAINTAINER niiv0832 <dockerhubme-3proxy@yahoo.com>

ENV LANG en_US.UTF-8
ENV DOWNLOAD_URL https://github.com/3proxy/3proxy/archive/refs/tags/0.9.3.tar.gz

RUN set -ex && \
	
	apk add --no-cache --virtual .build-deps \
		gcc \
		linux-headers \
		make \
		musl-dev \
		tar \
		openssl && \
####################################################
	wget -O 3proxy.tar.gz "$DOWNLOAD_URL" && \
	mkdir -p /usr/src/3proxy && \
	tar -xzf 3proxy.tar.gz -C /usr/src/3proxy --strip-components=1 && \
	rm 3proxy.tar.gz && \
####################################################
	make -C /usr/src/3proxy -f Makefile.Linux && \
	make -C /usr/src/3proxy -f Makefile.Linux install && \
####################################################
	rm -r /usr/src/3proxy && \
####################################################	
	apk del .build-deps && \
      	rm -rf /var/cache/apk/* && \
      	mkdir -p /etc/3proxy/cfg && \
      	mkdir -p /var/log/3proxy
####################################################	
VOLUME ["/etc/3proxy/cfg/"]
VOLUME ["/var/log/3proxy/"]
EXPOSE 7000-7120
CMD /usr/bin/3proxy /etc/3proxy/cfg/3proxy.cfg
