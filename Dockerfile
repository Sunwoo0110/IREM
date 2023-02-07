FROM debian:latest

COPY ./main.sh .

# ARG GH_TOKEN

# ENV GH_TOKEN $GH_TOKEN

RUN apt-get install -y apt-transport-https \
    && apt-get update \
    && apt-get install -y git \
    && chmod +x /main.sh

ENTRYPOINT [ "/main.sh" ]
# ENTRYPOINT [ "sh", "-c", "echo $GH_TOKEN" ]