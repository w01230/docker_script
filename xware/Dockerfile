# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM debian:stretch-slim

RUN /bin/sed -i.bak 's/archive/cn\.archive/' /etc/apt/sources.list
RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && apt-get install -y procps zlib1g-dev lib32z1 lib32ncurses5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /app/bin

COPY thunder /app/
COPY start.sh /app/
VOLUME /app/TDDOWNLOAD

EXPOSE 9000
WORKDIR /app
RUN chmod +x start.sh && chmod +x ./bin/portal
CMD ["./start.sh"]

