FROM debian:latest

COPY main.sh /usr/local/bin

RUN ls \
    && apt-get update \
    && apt-get install -y git

ENTRYPOINT [ "/main.sh" ]
