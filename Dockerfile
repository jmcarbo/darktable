FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \ 
  && apt-get install -y xrdp software-properties-common mate-core mate-desktop-environment mate-notification-daemon \ 
  && add-apt-repository -y ppa:pmjdebruijn/darktable-release \
  && apt-get -y update \
  && apt-get -y install darktable \
  && sed -i.bak '/fi/a #xrdp multiple users configuration \n mate-session \n' /etc/xrdp/startwm.sh

RUN xrdp-keygen xrdp /etc/xrdp/rsakeys.ini

EXPOSE 3389

CMD for i in $(seq 1 20); do useradd -m -p $(echo ${USER_PASSWORD:=password} |openssl passwd -1 -stdin) user$i; done && xrdp-sesman && xrdp -nodaemon
