#!/bin/sh

if [ "$REQUIRED_PACKAGES" ]; then
    apk --no-cache add $REQUIRED_PACKAGES
fi
