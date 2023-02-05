FROM ubuntu:latest

COPY . .

# RUN apt-get update && \
# apt-get install -y git

# ENTRYPOINT [ "sh", "-c", "./test.sh", "$github-repo-url", "$github-user-id", "$github-user-password" ]
ENTRYPOINT [ "./test.sh" ]