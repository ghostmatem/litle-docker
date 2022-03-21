#!/bin/bash

set -e

if [ "$1" == '-a' ]; then
im_here=$(pwd)
cd ../android-platforms/
bash build.sh
cd "$im_here"
true
fi

docker build . -t flutter-android