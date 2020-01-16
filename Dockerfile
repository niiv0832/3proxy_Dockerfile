###############################################################################
# BUILD STAGE
ARG VERSION=0.8.13

FROM alpine:latest

ARG VERSION


RUN set -x && \
    apk --no-cache --update add \
    bash \
    build-base \
    linux-headers \
    ca-certificates \
    curl \
    git \
    make \
    upx && \
    
RUN set -x && \
    apk add --update alpine-sdk wget bash ca-certificates curl && \
    cd / && \
    wget -q  https://github.com/z3APA3A/3proxy/archive/${VERSION}.tar.gz && \
    tar -xf ${VERSION}.tar.gz && \
    cd 3proxy-${VERSION} && \
    make -f Makefile.Linuх
    
###############################################################################
# PACKAGE STAGE

FROM scratch

ARG VERSION

COPY --from=0 /3proxy-${VERSION}/src/3proxy /etc/3proxy/

VOLUME ["/cfg/"]
VOLUME ["/var/log/3proxy/"]

EXPOSE 7000-7120

ENTRYPOINT ["/3proxy"]

CMD ["/cfg/3proxy.cfg"]
