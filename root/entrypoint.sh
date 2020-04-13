#!/bin/sh -x

for script in $(find /entrypoint.d -type f -name '*.sh'); do
    sh "$script" || exit $?
done

mkdir -p "$SLAVE_ROOT"

exec $*
