FROM gui-basic

LABEL maintainer="ihsanpmh@gmail.com"

# Install Updates and ssh server
RUN \
    apt update && \
    apt install -y openssh-server

# X11 Config
RUN sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config
RUN useradd -m pmihsan -p $(openssl passwd 1234)

EXPOSE 22

# Service SSH start
CMD service ssh start ; bash
