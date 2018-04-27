FROM alpine
MAINTAINER JohnW <4585006@gmail.com>

ARG BRANCH=manyuser
ARG WORK=~

ENV SERVER_PORT0=8000
ENV SERVER_PORT1=8100

RUN apk --no-cache add python libsodium wget \
    && mkdir -p $WORK \
    && wget -qO- --no-check-certificate https://github.com/shadowsocksr-backup/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK

WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks

EXPOSE $SERVER_PORT0 $SERVER_PORT1
ENTRYPOINT ["python", "server.py"]
CMD ["-c", "/etc/shadowsocksr/shadowsocksr.json"]
