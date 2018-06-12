FROM alpine
MAINTAINER JohnW <4585006@gmail.com>

ARG VERSION=3.2.0
ARG URL=https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$VERSION/shadowsocks-libev-$VERSION.tar.gz
ARG SOURCE=shadowsocks-libev-$VERSION
ARG WORK=/root

ENV SERVER_PORT=8200

WORKDIR $WORK

RUN apk --no-cache add bash libev libsodium pcre c-ares mbedtls\
    && apk --no-cache add --virtual BUILD_DEP git autoconf automake gettext libtool build-base libev-dev libsodium-dev mbedtls-dev pcre-dev c-ares-dev linux-headers \
    && wget -qO- --no-check-certificate $URL | tar -xzf - \
    && cd $SOURCE \
    && autoreconf --install --force \
    && ./configure --disable-documentation \
    && make install \
    && cd .. \
    && rm -rf $SOURCE \
    && apk del BUILD_DEP 
    
EXPOSE $SERVER_PORT
ENTRYPOINT ["ss-server"]
CMD ["-c", "/etc/shadowsocks/shadowsocks.json"]