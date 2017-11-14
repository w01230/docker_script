#!/bin/sh

docker run --name ipsec \
	-e "VPN_IPSEC_PSK=0x01230" \
	-e "VPN_USER=w01230" \
	-e "VPN_PASSWORD=0x0000" \
	--restart=always \
	-p 500:500/udp \
	-p 4500:4500/udp \
	-v /lib/modules:/lib/modules:ro \
	-d --privileged \
	hwdsl2/ipsec-vpn-server:latest
