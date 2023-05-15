FROM kalilinux/kali-rolling

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Installing updates, dependencies, ssh configurations and adding user 
RUN apt-get update \
    && apt-get install -y openssh-server openssl shellinabox nano curl

RUN mkdir /var/run/sshd \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && useradd pmihsan \
    && usermod -aG sudo pmihsan \
    && echo 'pmihsan:kali' | chpasswd

EXPOSE 22 4200 

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]