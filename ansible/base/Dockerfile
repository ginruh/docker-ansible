FROM rockylinux/rockylinux:8.5
LABEL maintainer="iyorozuya"
LABEL com.centurylinklabs.watchtower.enable="false"

ENV container=docker

# Args
ARG USERNAME=rocky
ARG UID=1000
ARG GID=1000

# Update and upgrade
RUN dnf update -y
RUN dnf upgrade -y

# Install required packages
RUN dnf install \
    epel-release \
    python3-pip \
    sudo -y
RUN pip3 install --upgrade pip

# Create user
RUN groupadd -g $GID $USERNAME
RUN adduser $USERNAME -u $UID -g $GID