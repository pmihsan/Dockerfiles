FROM ubuntu:latest

LABEL maintainer="ihsanpmh@gmail.com"

# Install Updates and dependencies
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y ubuntu-desktop lightdm

# Display Manager configurations
RUN rm /run/reboot-required*
RUN echo "/usr/sbin/lightdm" > /etc/X11/default-display-manager
RUN echo "\
[LightDM]\n\
[Seat:*]\n\
type=xremote\n\
xserver-hostname=host.docker.internal\n\
xserver-display-number=0\n\
autologin-user=root\n\
autologin-user-timeout=0\n\
" > /etc/lightdm/lightdm.conf.d/lightdm.conf

# Setting display environment
ENV DISPLAY=host.docker.internal:0.0

# start display manager
CMD service dbus start ; /usr/lib/systemd/systemd-logind & service lightdm start
