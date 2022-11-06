FROM ubuntu:latest

# Updates
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y lubuntu-desktop

RUN rm /run/reboot-required*

# User Add
RUN useradd -m testuser -p $(openssl passwd 1234)
RUN usermod -aG sudo testuser

# Install RDP
RUN apt install -y xrdp
RUN adduser xrdp ssl-cert

# RDP Configs
RUN sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=Lubuntu\\n\
export XDG_SESSION_TYPE=x11\\n\
export XDG_CURRENT_DESKTOP=LXQt\\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-Lubuntu:/etc/xdg\\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

# Start RDP Service
CMD service xrdp start; bash
