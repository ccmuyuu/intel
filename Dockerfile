FROM kasmweb/ubuntu-jammy-desktop:1.14.0
COPY ./vasp.6.3.0.tgz /app
COPY ./makefile.include /app
COPY ./1.sh /app
RUN chmod 755 /app/1.sh
CMD  /app/1.sh