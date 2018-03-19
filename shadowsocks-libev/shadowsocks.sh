#!/bin/sh

docker run -d --name shadowsocks-libev \
	-p 8200:8200 \
	-e "SERVER_PORT=8200" \
	-v /root/docker/shadowsocks-libev:/etc/shadowsocks \
	--restart=always \
	shadowsocks-libev
