FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

# the build environment for tvheadend

RUN apt-get update && apt-get install -y pkg-config python build-essential libssl-dev\
	libhdhomerun-dev liburiparser-dev libdbus-1-dev && mkdir /mysrc
ADD libiconv-1.13.1 /mysrc/libiconv-1.13.1
ADD tv /mysrc/tv
ADD install.sh /usr/local/bin/

WORKDIR /mysrc/libiconv-1.13.1
RUN ./configure; make; make install

WORKDIR /mysrc/tv
RUN ./configure --disable-avahi --disable-dvben50221 --disable-libav; make
VOLUMES ["/mysrc"]

CMD ["/usr/local/bin/install.sh"]
