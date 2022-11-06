FROM pmihsan/kali-linux:latest
LABEL maintainer="ihsanpmh@gmail.com"

# Install Necessary dependencies
RUN 	apt-get update  && \
	apt install -y openssh-server sudo

# Configurations for your ssh
RUN	mkdir /var/run/sshd && \
     	sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
     	sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
     	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
     	

# Adding password for root user and creating a user named pmihsan
RUN 	echo 'root:kali' | chpasswd && \
     	useradd pmihsan && \
     	echo 'pmihsan:kali' | chpasswd

# For Security purposes after login change the password

# Adding user pmihsan to sudo users group
RUN usermod -aG sudo pmihsan

# For Enabling X11 Forwarding
RUN sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
