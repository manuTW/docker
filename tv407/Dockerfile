FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

RUN apt-get update && apt-get install -y pkg-config libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev
ADD tv407.tar.gz /root/
ADD libiconv-1.13.1.tar.gz /root/

# libiconv-1.14 fails
WORKDIR /root/libiconv-1.13.1
RUN ./configure; make; make install; make clean
ENV LD_LIBRARY_PATH /usr/local/lib

#tvheadend
WORKDIR /root/tv407
RUN ./configure --disable-avahi --disable-dvben50221 --disable-libav; make; make install; make clean


CMD ["/bin/bash"]
