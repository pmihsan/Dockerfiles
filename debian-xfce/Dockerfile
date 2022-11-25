FROM debian:latest

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Installing updates and dependencies
RUN \
    apt update && \
    apt install -y sudo && \
    apt install -y xfce4 xrdp xorg dbus-x11 x11-xserver-utils

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y wget

RUN sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini

# Adding user pmihsan and providing password 
RUN useradd -m pmihsan -p $(openssl passwd 1234)

# For Security Purposes change the password after login

# Adding user pmihsan to sudo users group
RUN usermod -aG sudo pmihsan

EXPOSE 3390

# Starting the ssh service
CMD /etc/init.d/xrdp restart; bash
