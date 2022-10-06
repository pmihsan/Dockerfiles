FROM debian:latest

RUN \
    apt update && \
    apt install -y openssh-server openssl sudo 

RUN sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config
RUN useradd -m pmihsan -p $(openssl passwd pm@05)

RUN usermod -aG sudo pmihsan

EXPOSE 22

CMD service ssh start ; bash
