FROM	 archlinux:latest

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Update the repositories
RUN	 pacman -Syy

# Install openssh
RUN	 pacman -S --noconfirm archey3 vim nano openssl sudo openssh

# Generate host keys
RUN  /usr/bin/ssh-keygen -A

# Add password to root user
# RUN	 echo 'root:roottoor' | chpasswd

# Adding additional user
RUN useradd -m pmihsan -p $(openssl passwd 1234)

# Adding user to sudo group
RUN usermod -aG wheel pmihsan

RUN sed -i -e 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

# Fix sshd
RUN  sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# Expose tcp port
EXPOSE	 22

# Run openssh daemon
CMD	 ["/usr/sbin/sshd", "-D"]
