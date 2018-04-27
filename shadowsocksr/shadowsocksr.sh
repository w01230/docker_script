#!/bin/sh

docker run -d --name shadowsocksr\
	-p xxxx:xxxx/tcp \
	-p xxxx:xxxx/udp \
	-p xxxx:xxxx/tcp \
	-p xxxx:xxxx/udp \
	-e "SERVER_PORT0=xxxx" \
	-e "SERVER_PORT1=xxxx" \
	-v /root/shadowsocksr:/etc/shadowsocksr \
	--restart=always \
	shadowsocksr
