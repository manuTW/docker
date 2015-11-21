FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

# need to
#  - export port 9981...default listening port of tvheadend http server
#  - mount /root/.hts for dvb settings
#  - mount /root/Videos for video recordings
#  - access /dev/dvb for devices

RUN apt-get update && apt-get install -y pkg-config libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev
ENV LD_LIBRARY_PATH /usr/local/lib

WORKDIR /root
RUN mkdir Videos

CMD ["/usr/local/bin/tvheadend", "-C", "-d"]

