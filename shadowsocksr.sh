#!/bin/sh

docker run -d -p xxxx:xxxx --name shadowsocksr \
       	-e "SERVER_ADDR=0.0.0.0" \
       	-e "SERVER_PORT=xxxx" \
	-e "PASSWORD=xxxx" \
	-e "METHOD=chacha20" \
	-e "PROTOCOL=auth_sha1_v4_compatible" \
	-e "OBFS=http_simple_compatible" \
	-e "TIMEOUT=300" \
	--restart=always \
	breakwa11/shadowsocksr:manyuser
