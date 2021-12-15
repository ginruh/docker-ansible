FROM iyorozuya/ansible:base
LABEL maintainer="iyorozuya"
LABEL com.centurylinklabs.watchtower.enable="false"

ENV container=docker

# Args
ARG USERNAME=rocky

# Install ansible
USER $USERNAME
RUN pip3 install --user ansible==4.10

WORKDIR /app

CMD ["/usr/lib/systemd/systemd"]