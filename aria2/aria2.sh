#!/bin/sh

sudo docker run -d \
		--name=aria2 \
		-p 6800:6800 \
		-v /nas/download/TDDOWNLOAD:/data \
		aria2:1.0
