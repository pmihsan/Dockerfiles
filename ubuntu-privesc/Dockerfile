FROM ubuntu:latest

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Installing updates and dependencies
RUN \
    apt update && \
    apt install -y openssh-server openssl sudo gcc nginx 

# Configuration for X11 Forwarding
RUN sed -i 's/#*X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#*X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config

# Configure root shell
RUN cp /etc/skel/.bashrc /etc/skel/.profile /root

# Adding user pmihsan and providing password 
RUN useradd -m pmihsan -p $(openssl passwd 1234)

# For Security Purposes change the password after login

# Adding user pmihsan to sudo users group
RUN usermod -aG sudo pmihsan

# Sample User
RUN useradd administrator -p $(openssl passwd admin)

# Adding home diretcory to user administrator
RUN mkdir /home/administrator

# Change Ownership
RUN chown -R administrator:administrator /home/administrator
RUN cp /etc/skel/.bashrc /etc/skel/.profile /home/administrator/

# SUDO ESC
RUN echo "administrator ALL=(ALL) NOPASSWD: /usr/bin/find" >> /etc/sudoers

# SUID ESC
RUN chmod u+s /bin/base64

# Sample User
RUN useradd stark -p $(openssl passwd stark@123)

# Adding home diretcory to user stark
RUN mkdir /home/stark

# Change Ownership
RUN chown -R stark:stark /home/stark
RUN cp /etc/skel/.bashrc /etc/skel/.profile /home/stark/

# PATH ESC
RUN mkdir /home/stark/configs
WORKDIR /home/stark/configs
RUN touch file.txt file_path.c
RUN echo "#include<stdio.h>" >> file_path.c
RUN echo "#include<unistd.h>" >> file_path.c
RUN echo "void main(int a, char *ag[]){" >> file_path.c
RUN echo "setuid(0);setgid(0);" >> file_path.c
RUN echo "system(ag[1]); }" >> file_path.c
RUN gcc file_path.c -o path -w
RUN chmod u+s path

# Sample User
RUN useradd michael -p $(openssl passwd butterfly1)

# Adding home diretcory to user administrator
RUN mkdir /home/michael

# Change Ownership
RUN chown -R michael:michael /home/michael
RUN cp /etc/skel/.bashrc /etc/skel/.profile /home/michael/

# Nginx Config
RUN echo "A stock of images for administratoring. Many sizes and formats (eg. jpg, png, gif) for free download" >> /var/www/html/images
RUN echo "A miscellany of text and archives files. Download files as html, csc, css, zip, bzip2 and more" >> /var/www/html/others
RUN echo "A great collection of video files for administratoring and demo use. Choose file format and size to free download" >> /var/www/html/videos 
RUN echo "Do you need mp3, wav or other audio format for administratoring? Download free files by size and format" >> /var/www/html/audios
RUN echo "A set of document files: doc, docx, odt, pdf, xls, ppt, pps and more. Download them for free" >> /var/www/html/docs  
RUN echo "Find it's encryption and its value (is pass) => d37fec497a6b76d2139dccec3c6f125f" >> /var/www/html/enc
RUN echo "This file contains the last serial number assigned to an incoming PR. It is used internally by gnats; you need never touch this file." >> /var/www/html/admin 
RUN echo "User:0acf4539a14b3aa27deeb4cbdf6e989f" >> /var/www/html/config

# User stark file identify
RUN echo "Stark loves coffee and he buys for me as well(search a hidden file)" >> /home/michael/usr.txt

# Hidden file
RUN echo "Search for a file in a directory which can be accessed by any unpriveleged user" >> /home/michael/.res

# User Details of stark
RUN echo "dXNlcjpzdGFyawpwYXNzd29yZDpzdGFyYnVja3MK" >> /tmp/.b64

RUN cd

EXPOSE 22 80

# Starting the ssh service
CMD service ssh start; service nginx start; bash
