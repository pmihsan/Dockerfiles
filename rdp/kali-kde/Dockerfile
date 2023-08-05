FROM kalilinux/kali-rolling

LABEL maintainer "ihsanpmh@gmail.com"

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get install -y kali-desktop-kde xorg xrdp

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y wget

RUN sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini

RUN useradd -m testuser -p $(openssl passwd 1234)

RUN usermod -aG sudo testuser

EXPOSE 3390

CMD /etc/init.d/xrdp restart; bash
