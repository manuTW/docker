FROM busybox
MAINTAINER Manu Chen

# to hold source of tvheadend 4.0.7 and it's dvb scan data
# the build system is held in build_tv407

RUN mkdir /mysrc
ADD tv407.tar.gz /mysrc
ADD libiconv-1.13.1.tar.gz /mysrc

VOLUME /mysrc

CMD ["/bin/sh"]

