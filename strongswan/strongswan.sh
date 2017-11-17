#!/bin/bash

if [ "$1" == "init" ]; then
	echo "strongswan init"
	docker run -d --rm \
		-v "${PWD}/data:/mnt" \
		-e VPN_DOMAIN=1.0.0.0 \
		-e VPN_USERNAME=foobar!	 \
		-e VPN_PASSWORD=foobar! \
		-e VPN_P12_PASSWORD=foobar! \
		strongswan:1.0 \
		init
else
	echo "strongswan run"
	docker run -d --name strongswan \
		--privileged=true \
		--cap-add=NET_ADMIN \
		--restart=always \
		-p 500:500/udp \
		-p 4500:4500/udp \
		-v "/lib/modules:/lib/modules:ro" \
		-v "${PWD}/data/ipsec.d:/etc/ipsec.d:ro" \
		-v "${PWD}/data/ipsec.conf:/etc/ipsec.conf:ro" \
		-v "${PWD}/data/ipsec.secrets:/etc/ipsec.secrets:ro" \
		-v "${PWD}/data/strongswan.conf:/etc/strongswan.conf:ro" \
		strongswan:1.0 
fi
