FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

# the build environment for tvheadend

RUN apt-get update && apt-get install -y pkg-config build-essential libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev

ADD libiconv-1.13.1 /mysrc/
ADD tv /mysrc/

WORKDIR /mysrc/libiconv-1.13.1
RUN ./configure; make

WORKDIR /mysrc/tv
RUN ./configure --disable-avahi --disable-dvben50221 --disable-libav; make
VOLUMES ["/mysrc"]

CMD ["/bin/bash"]
