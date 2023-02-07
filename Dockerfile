FROM debian:latest

RUN ls \
    && apt-get update \
    && apt-get install -y git
    
COPY entrypoint.sh /entrypoint.sh
COPY src src 

ENTRYPOINT [ "/entrypoint.sh" ]
