#!/bin/bash
tar -xf /app/vasp.6.3.0.tgz -C /usr/local
cp /app/makefile.include /usr/local/vasp.6.3.0/makefile.include
cd /usr/local/vasp.6.3.0
apt update && apt install -y build-essential gfortran libopenblas-dev libopenmpi-dev libscalapack-openmpi-dev libfftw3-dev libhdf5-openmpi-dev libfftw3-mpi-dev cmake pkg-config
make DEPS=1 -j