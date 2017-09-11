#!/bin/sh

if [ "$REQUIRED_PACKAGES" ]; then
    apk --no-cache add $REQUIRED_PACKAGES
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
