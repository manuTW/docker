FROM manuchen/ubt-gcc
MAINTAINER Manu Chen

# need /mysrc be mounted as the source volume

RUN apt-get install -y make libssl-dev libhdhomerun-dev liburiparser-dev libdbus-1-dev &&\
	mkdir /root/Videos
ADD install /usr/local/bin/install

CMD ["/mysrc/install.sh"]

