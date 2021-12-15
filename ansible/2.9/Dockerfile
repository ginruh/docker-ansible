FROM iyorozuya/ansible:base
LABEL maintainer="iyorozuya"
LABEL com.centurylinklabs.watchtower.enable="false"

ENV container=docker

# Args
ARG USERNAME=rocky

# Install ansible
USER $USERNAME
RUN pip3 install --user ansible==2.9

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]