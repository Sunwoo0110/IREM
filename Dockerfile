FROM debian:latest

COPY ./main.sh /

RUN apt-get install -y apt-transport-https \
    && apt-get update \
    && apt-get install -y git

ENTRYPOINT [ "./main.sh" ]