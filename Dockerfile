ARG BASE_IMAGE_VERSION=3.11
FROM alpine:${BASE_IMAGE_VERSION}

MAINTAINER Dmitry Karikh <the.dr.hax@gmail.com>

ENV MASTER_URL="http://jenkins:8080" \
    SLAVE_NAME="" \
    SLAVE_SECRET="" \
    SLAVE_ROOT="/data" \
    # Preinstall packages at startup
    # see entrypoint.d/install-packages.sh
    REQUIRED_PACKAGES=""


ARG ADD_BUILD_PACKAGES=
RUN apk --no-cache add openjdk8-jre wget git ${ADD_BUILD_PACKAGES}

ADD root/ /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/swarm.sh"]
