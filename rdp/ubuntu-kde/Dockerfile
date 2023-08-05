FROM ubuntu:latest

# Install Updates
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y kubuntu-desktop

RUN rm /run/reboot-required*

# Adding User
RUN useradd -m testuser -p $(openssl passwd 1234)
RUN usermod -aG sudo testuser

# Install RDP
RUN apt install -y xrdp
RUN adduser xrdp ssl-cert

# RDP Config
RUN sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=ubuntu\\n\
export XDG_SESSION_TYPE=x11\\n\
export XDG_CURRENT_DESKTOP=ubuntu:GNOME\\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

# Start RDP
CMD service dbus start; /usr/lib/systemd/systemd-logind &  service xrdp start; bash
