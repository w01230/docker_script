#!/bin/sh

docker run -d \
        --name=xware \
	--restart=always \
        -v /nas/download:/data \
        xware:1.0
