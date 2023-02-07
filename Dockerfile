FROM debian:latest

COPY . .

RUN ls \
    && apt-get update \
    && apt-get install -y git

ENTRYPOINT [ "./main.sh" ]