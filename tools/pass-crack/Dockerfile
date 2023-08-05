FROM kalilinux/kali-rolling

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Installing updates, dependencies, ssh configurations and adding user 
RUN  apt update \
    && apt install -y ssh john gobuster  

RUN mkdir /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && echo 'root:kali' | chpasswd 

RUN useradd -m pmihsan -p $(openssl passwd 1234)

# Adding home diretcory to user pmihsan
RUN mkdir /home/pmihsan

# Change Ownership
RUN chown -R pmihsan:pmihsan /home/pmihsan
RUN cp /etc/skel/.bashrc /etc/skel/.profile /home/pmihsan/

EXPOSE 22

# Starting ssh service
CMD ["/usr/sbin/sshd", "-D"]
