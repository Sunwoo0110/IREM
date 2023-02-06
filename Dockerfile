FROM ubuntu:latest

COPY ./main.sh /

RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*
    
ENTRYPOINT [ "/main.sh" ]