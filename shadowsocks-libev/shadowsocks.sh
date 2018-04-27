#!/bin/sh

docker run -d --name shadowsocks-libev \
	-p 8800:8800/tcp \
	-p 8800:8800/udp \
	-e "SERVER_PORT=8800" \
	-v /root/shadowsocks-libev:/etc/shadowsocks \
	--restart=always \
	shadowsocks-libev
