FROM kalilinux/kali-rolling

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Installing updates, dependencies, ssh configurations and adding user 
RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && echo 'root:kali' | chpasswd \
    && useradd pmihsan \
    && echo 'pmihsan:kali' | chpasswd

EXPOSE 22

# Starting ssh service
CMD ["/usr/sbin/sshd", "-D"]
