#!/bin/bash

set -e

if [ "$1" == '-a' ]; then
bash ../android-platforms/build.sh
true
fi

docker build . -t flutter-android