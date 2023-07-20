FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install qemu-kvm *zenhei* xz-utils dbus-x11 curl nano unzip autocutsel htop firefox-esr gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN curl -LO https://proot.gitlab.io/proot/bin/proot
RUN chmod 755 proot
RUN mv proot /bin
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  $HOME/.vnc
RUN echo 'zlSvLT5E23ARKq5HESl0zzMT5wUdQETSDi+dutUsWzU=' | vncpasswd -f > $HOME/.vnc/passwd
RUN chmod 600 $HOME/.vnc/passwd
RUN echo 'whoami ' >>/test.sh
RUN echo 'cd ' >>/test.sh
RUN echo "su -l -c  'vncserver :2000 -geometry 1280x800' "  >>/test.sh
RUN echo 'cd /noVNC-1.2.0' >>/test.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/test.sh
RUN chmod 755 /test.sh
EXPOSE 8900
CMD  /test.sh
RUN apt-get update && apt-get install -y locales
RUN sed -i -e 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
RUN wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.tar.gz
RUN tar -xvf jdk-20_linux-x64_bin.tar.gz
RUN apt update && apt install python3-pip python3-venv
