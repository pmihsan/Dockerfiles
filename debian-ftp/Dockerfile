FROM debian:latest

# Maintainer Info
LABEL maintainer="ihsanpmh@gmail.com"

# Installing updates and dependencies
RUN apt update && apt install -y vsftpd

RUN cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

# testuser to login into ftp
RUN useradd -m testuser

RUN echo 'testuser:test2' | chpasswd

# Making a directory for ftp files
RUN mkdir /srv/ftp/directory

RUN usermod -d /srv/ftp/directory ftp

# This is for anonymous login
RUN sed -i 's/anonymous_enable=NO/anonymous_enable=YES/g' /etc/vsftpd.conf

# For write enable
RUN sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf

EXPOSE 20 21 47400-47405

# Starting the ftp service
CMD service vsftpd start ; bash
