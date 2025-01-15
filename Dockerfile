FROM --platform=$BUILDPLATFORM ubuntu:latest AS build
ARG TARGETOS
ARG TARGETARCH

LABEL maintainer="renegadespork"

ENV TIMEZONE=America/Los_Angeles \
    PUID=1000 \
    PGID=1000 \
    AUTO_UPDATE=true \
    BACKUPS=false \
    LOGGING=false \
    MAX_PLAYERS=10 \
    ALLOW_LIST=true \
    ALLOW_LIST_MEMBERS=""

RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl unzip jq -y

RUN mkdir /prep && chown -R ubuntu /prep
RUN mkdir /server && chown -R ubuntu /server
RUN mkdir /scripts && chown -R ubuntu /scripts
RUN mkdir /backups && chown -R ubuntu /backups
RUN mkdir /psm && chown -R ubuntu /psm

COPY info.sh /psm/info.sh
COPY logo.txt logo.txt

CMD ["/bin/bash", "/psm/info.sh"]