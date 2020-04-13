FROM alpine:3.11

MAINTAINER Dmitry Karikh <the.dr.hax@gmail.com>

ENV MASTER_URL="http://jenkins:8080" \
    SLAVE_NAME="" \
    SLAVE_SECRET="" \
    SLAVE_ROOT="/data" \
    # Preinstall packages at startup
    # see entrypoint.d/install-packages.sh
    REQUIRED_PACKAGES=""

RUN apk --no-cache add openjdk8-jre wget git

ADD root/ /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/swarm.sh"]
