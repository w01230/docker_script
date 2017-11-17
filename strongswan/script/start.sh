#!/bin/bash -e
if [ "$1" == "init" ]; then
	echo "Intializing config"
	./root/init.sh
else
	echo "Starting VPN server"
	iptables -t nat -A POSTROUTING -s 10.0.2.0/24 -j MASQUERADE
	sysctl -w net.ipv4.ip_forward=1
	/usr/sbin/ipsec start --nofork
fi
