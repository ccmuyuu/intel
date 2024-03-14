FROM ubuntu
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install qemu-kvm *zenhei* xz-utils dbus-x11 curl nano unzip autocutsel htop gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz
RUN tar -xvf v1.4.0.tar.gz
RUN mkdir  $HOME/.vnc
RUN echo 'zlSvLT5E23ARKq5HESl0zzMT5wUdQETSDi+dutUsWzU=' | vncpasswd -f > $HOME/.vnc/passwd
RUN echo '/bin/env  MOZ_FAKE_NO_SANDBOX=1  dbus-launch xfce4-session'  > $HOME/.vnc/xstartup
RUN chmod 600 $HOME/.vnc/passwd
RUN chmod 755 $HOME/.vnc/xstartup

RUN echo 'whoami ' >>/test.sh
RUN echo 'cd ' >>/test.sh
RUN echo "su -l -c  'vncserver :2000 -geometry 1280x800' "  >>/test.sh
RUN echo 'cd /noVNC-1.4.0' >>/test.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/test.sh
RUN chmod 755 /test.sh
EXPOSE 8900
CMD  /test.sh
RUN apt-get update && apt-get install -y locales
RUN sed -i -e 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
RUN apt update && apt install -y python3-pip python3-venv build-essential gfortran libopenblas-dev libopenmpi-dev libscalapack-openmpi-dev libfftw3-dev libhdf5-openmpi-dev libfftw3-mpi-dev cmake pkg-config
COPY vasp.6.3.0.tgz /

