FROM debian:latest

COPY main.sh /main.sh

RUN ls \
    && apt-get update \
    && apt-get install -y git

ENTRYPOINT [ "/main.sh" ]
