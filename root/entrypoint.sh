#!/bin/sh -x

for script in $(find /entrypoint.d -type f -name '*.sh'); do
    sh "$script" || exit $?
done

mkdir -p "$JENKINS_SLAVE_ROOT"

exec $*
