FROM ubuntu:latest

COPY . .

RUN apt-get update && \
    apt-get install -y git

ENTRYPOINT [ "--no-cache", "./main.sh" ]