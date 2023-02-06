FROM ubuntu:latest

COPY ./main.sh /

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/main.sh" ]