FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

# need /mysrc be mounted as the source volume

RUN apt-get install -y make libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev

WORKDIR /root
RUN mkdir Videos
ENV LD_LIBRARY_PATH /usr/local/lib

CMD ["/usr/local/bin/tvheadend", "-C", "-d"]

