# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM debian:stretch-slim

RUN apt-get update && \
    apt-get install -y libc6-i386 lib32z1 procps &&\
    apt-get clean

WORKDIR /xware
ADD Xware1.0.31_x86_32_glibc.tar.gz /xware
COPY monitor.sh /xware

VOLUME /data

CMD ["./monitor.sh"]
