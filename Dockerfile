FROM docker

MAINTAINER Dmitry Karikh <the.dr.hax@gmail.com>

ENV JENKINS_SLAVE_ROOT="/root/jenkins-slave"

RUN apk --no-cache add openjdk8-jre wget git

RUN mkdir -p "$JENKINS_SLAVE_ROOT"

# Slave settings
ENV JENKINS_MASTER_USERNAME="jenkins" \
    JENKINS_MASTER_PASSWORD="jenkins" \
    JENKINS_MASTER_URL="http://jenkins:8080/" \
    JENKINS_SLAVE_MODE="exclusive" \
    JENKINS_SLAVE_NAME="swarm-$RANDOM" \
    JENKINS_SLAVE_WORKERS="1" \
    JENKINS_SLAVE_LABELS="" \
    AVD=""

# Install Jenkins slave (swarm)
ADD swarm.jar /
ADD entrypoint.sh /

# Install rancher-compose
RUN wget -O /tmp/rc.tgz https://github.com/rancher/rancher-compose/releases/download/v0.12.5/rancher-compose-linux-amd64-v0.12.5.tar.gz > /tmp/rc.tgz \
 && tar -xzvf /tmp/rc.tgz \
 && mv rancher-compose-v0.12.5/rancher-compose usr/bin \
 && rm -rf rancher-compose-v0.12.5 \
 && rm /tmp/rc.tgz

ENTRYPOINT /entrypoint.sh
