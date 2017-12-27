FROM alpine:latest

RUN apk add --no-cache aria2

COPY aria2/aria2.* /etc/
VOLUME /data
EXPOSE 6800

ENTRYPOINT [ "/usr/bin/aria2c", "--conf-path=/etc/aria2.conf" ]

