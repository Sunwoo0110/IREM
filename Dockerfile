FROM debian:latest

RUN ls \
    && apt-get update \
    && apt-get install -y git
    
COPY entrypoint.sh /entrypoint.sh

COPY src/make_appserver.sh /make_appserver.sh
COPY src/make_config.sh workflow/make_config.sh
COPY src/make_env_sample.sh workflow/make_env_sample.sh
COPY src/make_gitignore.sh workflow/make_gitignore.sh
COPY src/make_package_dot_json.sh workflow/make_package_dot_json.sh
COPY src/make_routes.sh workflow/make_routes.sh
COPY src/make_src_directory.sh workflow/make_src_directory.sh

RUN ls

ENTRYPOINT [ "/entrypoint.sh" ]
