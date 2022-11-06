FROM ubuntu:latest

# Install updates and lubuntu desktop and light display manager
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y lubuntu-desktop lightdm

# Config for display manager
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
autologin-session=Lubuntu\n\
" > /etc/lightdm/lightdm.conf.d/lightdm.conf

# Setting display
ENV DISPLAY=host.docker.internal:0.0

# Start service
CMD service dbus start ; service lightdm start
