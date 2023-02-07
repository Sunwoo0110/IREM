FROM debian:latest

RUN ls \
    && apt-get update \
    && apt-get install -y git
    
COPY . .

ENTRYPOINT [ "./entrypoint.sh" ]
