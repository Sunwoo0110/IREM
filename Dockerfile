FROM ubuntu:18.04

COPY . .

RUN apt-get update
# apt-get install -y git && \
# rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "./main.sh" ]