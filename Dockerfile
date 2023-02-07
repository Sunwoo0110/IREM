FROM debian:latest

RUN ls \
    && apt-get update \
    && apt-get install -y git
    
COPY main.sh /main.sh

ENTRYPOINT [ "/main.sh" ]
