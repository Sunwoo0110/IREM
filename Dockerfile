FROM ubuntu:latest

COPY . .

RUN ls && \
    apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "./main.sh" ]