FROM debian:latest

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Installing updates and dependencies
RUN \
    apt update && \
    apt install -y openssh-server openssl sudo 

# Configuration for X11 Forwarding
RUN sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config

# Adding user pmihsan and providing password 
RUN useradd -m pmihsan -p $(openssl passwd 1234)

# For Security Purposes change the password after login

# Adding user pmihsan to sudo users group
RUN usermod -aG sudo pmihsan

EXPOSE 22

# Starting the ssh service
CMD service ssh start ; bash
