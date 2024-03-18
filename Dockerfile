FROM debian
RUN dpkg --add-architecture i386
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install wine qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox-esr gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz
RUN tar -xvf noVNC-1.4.0.tar.gz
RUN mkdir  $HOME/.vnc
RUN echo 'BpUtnpwLym1e+/Efum2kxy6fOVa1UV/+YKaTMys7pcw=' | vncpasswd -f > $HOME/.vnc/passwd
RUN echo '/bin/env  MOZ_FAKE_NO_SANDBOX=1  dbus-launch xfce4-session'  > $HOME/.vnc/xstartup
RUN chmod 600 $HOME/.vnc/passwd
RUN chmod 755 $HOME/.vnc/xstartup
RUN echo 'whoami ' >>/Sophia.sh
RUN echo 'cd ' >>/Sophia.sh
RUN echo "su -l -c 'vncserver :2000 -geometry 1360x768' "  >>/Sophia.sh
RUN echo 'cd /noVNC-1.4.0' >>/Sophia.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/Sophia.sh
RUN chmod 755 /Sophia.sh
EXPOSE 8900
CMD  /Sophia.sh
COPY /data/vasp.6.3.0.tgz $HOME
RUN apt install -y build-essential gfortran libopenblas-dev libopenmpi-dev libscalapack-openmpi-dev libfftw3-dev libhdf5-openmpi-dev libfftw3-mpi-dev cmake pkg-config
RUN tar -zxvf $HOME/vasp.6.3.0.tgz
COPY /data/makefile.tgz /vasp.6.3.0/makefile.include
RUN echo 'cd ' >>/vasp.sh
RUN echo 'cd /vasp.6.3.0' >>/vasp.sh
RUN echo 'make DEPS=1 -j' >>/vasp.sh
RUN chmod 755 /vasp.sh
CMD  /vasp.sh




