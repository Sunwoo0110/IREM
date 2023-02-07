FROM debian:latest

RUN ls \
    && apt-get update \
    && apt-get install -y git
    
COPY entrypoint.sh /entrypoint.sh

COPY src/make_appserver.sh /make_appserver.sh
COPY src/make_config.sh ./workspace/make_config.sh
COPY src/make_env_sample.sh /workspace/make_env_sample.sh
COPY src/make_gitignore.sh /workspace/make_gitignore.sh
COPY src/make_package_dot_json.sh /workspace/make_package_dot_json.sh
COPY src/make_routes.sh /workspace/make_routes.sh
COPY src/make_src_directory.sh /workspace/make_src_directory.sh
# COPY . .

RUN ls

ENTRYPOINT [ "/entrypoint.sh" ]
