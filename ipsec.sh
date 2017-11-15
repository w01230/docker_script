#!/bin/sh

docker run --name ipsec \
	-e "VPN_IPSEC_PSK=xxxxxx" \
	-e "VPN_USER=xxxxxx" \
	-e "VPN_PASSWORD=xxxxxx" \
	--restart=always \
	-p 500:500/udp \
	-p 4500:4500/udp \
	-v /lib/modules:/lib/modules:ro \
	-d --privileged \
	hwdsl2/ipsec-vpn-server:latest
