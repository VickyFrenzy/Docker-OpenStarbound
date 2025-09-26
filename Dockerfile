FROM debian:stable

RUN apt update && apt upgrade -y && apt install -y wget unzip

ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USERNAME=starbound

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID $USERNAME

RUN mkdir -p /starbound
RUN chown -R $USERNAME:$USERNAME /starbound

USER $USERNAME

VOLUME ["/starbound"]

ADD --chmod=0755 start.sh /start.sh

WORKDIR /

EXPOSE 21025

ENTRYPOINT ["bash", "/start.sh"]
