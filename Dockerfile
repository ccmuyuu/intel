FROM kasmweb/ubuntu-jammy-desktop:1.14.0
COPY ./vasp.6.3.0.tgz /app
COPY ./makefile.include /app
COPY ./1.sh /app
CMD  /app/1.sh