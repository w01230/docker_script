# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM debian:stretch-slim


ADD Xware1.0.31_x86_32_glibc.tar.gz /usr/bin/

RUN apt-get update && \
    apt-get install -y libc6-i386 lib32z1 procps &&\
    apt-get clean

COPY exec.sh /usr/bin/

VOLUME /data

CMD [ "exec.sh" ]
