FROM debian:latest

RUN ls \
    && apt-get update \
    && apt-get install -y git
    
COPY entrypoint.sh /entrypoint.sh
COPY src/make_appserver.sh src/make_appserver.sh
COPY src/make_config.sh src/make_config.sh
COPY src/make_env_sample.sh src/make_env_sample.sh
COPY src/make_gitignore.sh src/make_gitignore.sh
COPY src/make_package_dot_json.sh src/make_package_dot_json.sh
COPY src/make_routes.sh src/make_routes.sh
COPY src/make_src_directory.sh src/make_src_directory.sh

ENTRYPOINT [ "/entrypoint.sh" ]
