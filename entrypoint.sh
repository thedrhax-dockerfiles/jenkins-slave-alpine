#!/bin/sh

if [ "$DOCKER_HUB_LOGIN" ]; then
mkdir -p /root/.docker
cat >> /root/.docker/config.json <<EOF
{
  "auths": {
    "https://index.docker.io/v1/": {
      "auth": "$DOCKER_HUB_LOGIN",
      "email": "$DOCKER_HUB_EMAIL"
    }
  }
}
EOF
fi

java -jar /swarm.jar \
    -disableClientsUniqueId \
    -username $JENKINS_MASTER_USERNAME \
    -password $JENKINS_MASTER_PASSWORD \
    -mode $JENKINS_SLAVE_MODE \
    -name $JENKINS_SLAVE_NAME \
    -executors $JENKINS_SLAVE_WORKERS \
    -master $JENKINS_MASTER_URL \
    -fsroot $JENKINS_SLAVE_ROOT \
    -labels "$JENKINS_SLAVE_LABELS swarm"
