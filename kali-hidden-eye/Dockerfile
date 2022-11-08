FROM ubuntu:latest
LABEl maintainer="ihsanpmh@gmail.com"

# Updates and Dependencies
RUN apt update && apt install -y openssh-server git python3 pip 

# To Install PHP
RUN echo "apt install php" >> install_php.sh

# Root User Configurations
RUN cp /etc/skel/.bashrc /etc/skel/.profile /root/

# SSH Configurations
RUN mkdir /var/run/sshd 

# Permit Root Login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config 
# Permit Password Authentication
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config 
# Remove PAM Authentication
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config 

# Adding Password to user root
RUN echo 'root:toor' | chpasswd 

# Additional Options
# X11-Forwarding for SSH
RUN sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config

# Creating home folder for hidden-eye
RUN mkdir -p /root/gitlab

# Change Working directory
WORKDIR /root/gitlab/

# Clone repository
RUN git clone https://gitlab.com/An0nUD4Y/hiddeneye.git

# Changing working directory into hidden-eye
WORKDIR /root/gitlab/hiddeneye

# Remove the git folder to remove tracking
RUN rm -rf .git

# Install the requirements 
RUN pip3 install -r requirements.txt

# Expose ports for ssh and http
EXPOSE 22 4040

CMD ["/usr/sbin/sshd", "-D"];
