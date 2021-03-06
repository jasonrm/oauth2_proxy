FROM alpine:latest
MAINTAINER Jason Richard McNeil <jason@jasonrm.net>

COPY build.sh /

RUN /bin/sh build.sh

ENTRYPOINT ["/usr/local/bin/oauth2_proxy"]
