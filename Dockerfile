FROM debian:latest

RUN ls \
    && apt-get update \
    && apt-get install -y git
    
COPY entrypoint.sh /entrypoint.sh

# COPY src/make_appserver.sh /make_appserver.sh
# COPY src/make_config.sh usr/local/home/make_config.sh
# COPY src/make_env_sample.sh /home/make_env_sample.sh
# COPY src/make_gitignore.sh /home/make_gitignore.sh
# COPY src/make_package_dot_json.sh /home/make_package_dot_json.sh
# COPY src/make_routes.sh /home/make_routes.sh
# COPY src/make_src_directory.sh /home/make_src_directory.sh
# COPY . .
COPY src /github/workspace/src/

RUN ls

ENTRYPOINT [ "/entrypoint.sh" ]
# ENTRYPOINT [ "./main.sh" ]
