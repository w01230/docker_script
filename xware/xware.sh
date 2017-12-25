docker run -d \
        --name=xware \
	--restart=always \
        -v /nas/download:/app/TDDOWNLOAD \
        xware:1.0
