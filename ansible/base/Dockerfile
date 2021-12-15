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

# Install systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install required packages
RUN dnf install \
    epel-release \
    python3-pip \
    sudo -y
RUN pip3 install --upgrade pip

# Create user
RUN groupadd -g $GID $USERNAME
RUN adduser $USERNAME -u $UID -g $GID