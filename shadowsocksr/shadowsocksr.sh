#!/bin/sh

docker run -d --name shadowsocksr\
	-p xxxx:xxxx \
	-p xxxx:xxxx \
	-e "SERVER_PORT0=xxxx" \
	-e "SERVER_PORT1=xxxx" \
	-v /root:/etc/shadowsocksr \
	--restart=always \
	shadowsocksr:1.0
