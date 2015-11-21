FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

# the build environment for tvheadend

RUN apt-get update && apt-get install -y pkg-config libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev

ADD build.sh /root/
CMD ["/root/build.sh"]
