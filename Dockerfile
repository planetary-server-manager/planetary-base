FROM ubuntu:latest

LABEL maintainer="renegadespork"

ENV TIMEZONE=America/Los_Angeles \
    PUID=1000 \
    PGID=1000 \
    AUTO_UPDATE=true \
    BACKUPS=false \
    LOGGING=false \
    MAX_PLAYERS=10 \
    ALLOW_LIST=true

RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl unzip -y

RUN mkdir /prep && chown -R ubuntu /prep
RUN mkdir /psm && chown -R ubuntu /psm

COPY info.sh /psm/info.sh

CMD ["/bin/bash", "/psm/info.sh"]