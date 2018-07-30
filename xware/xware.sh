#!/bin/sh

docker run -d \
        --name=xware \
	--restart=always \
        -v /nas/downloads:/data/TDDOWNLOAD \
        xware
