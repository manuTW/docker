FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

# need to
#  - export port 9981...default listening port of tvheadend http server
#  - mount /root/.hts for dvb settings
#  - mount /root/Videos for video recordings
#  - access /dev/dvb for devices

RUN apt-get install -y make libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev

WORKDIR /root
RUN mkdir Videos
ADD install.sh /usr/local/bin/

CMD ["/bin/bash"]

