# thorax/erigon is the official Erigon DockerHub repo according to 
# https://github.com/ledgerwatch/erigon/releases/tag/v2021.07.03
FROM thorax/erigon:v2021.08.01

USER root
RUN apk update && apk add --no-cache supervisor
COPY supervisord.conf /etc/supervisord.conf

USER erigon
RUN mkdir -p /home/erigon/.local/state
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
