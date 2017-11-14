#!/bin/sh

docker run -d -p 8000:8000 --name shadowsocksr \
       	-e "SERVER_ADDR=0.0.0.0" \
       	-e "SERVER_PORT=8000" \
	-e "PASSWORD=0x0000" \
	-e "METHOD=chacha20" \
	-e "PROTOCOL=auth_sha1_v4_compatible" \
	-e "OBFS=tls1.2_ticket_auth_compatible" \
	-e "TIMEOUT=300" \
	--restart=always \
	breakwa11/shadowsocksr:manyuser
