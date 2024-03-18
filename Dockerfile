FROM kasmweb/ubuntu-jammy-desktop:1.14.0
COPY ./vasp.6.3.0.tgz /app
RUN apt update && apt install -y build-essential gfortran libopenblas-dev libopenmpi-dev libscalapack-openmpi-dev libfftw3-dev libhdf5-openmpi-dev libfftw3-mpi-dev cmake pkg-config
RUN tar -zxvf /app/vasp.6.3.0.tgz -C /usr/local/vasp6.3.0
COPY ./makefile.include /usr/local/vasp.6.3.0/makefile.include
RUN echo 'cd ' >>/vasp.sh
RUN echo 'cd /usr/local/vasp.6.3.0' >>/vasp.sh
RUN echo 'make DEPS=1 -j' >>/vasp.sh
RUN chmod 755 /vasp.sh
CMD  /vasp.sh




