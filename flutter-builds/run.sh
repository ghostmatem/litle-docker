#!bin/bash

set -e

git clone https://github.com/ghostmatem/hello-world-app.git app/ \ &&
docker run -it --rm \
    -v ../app:/home/app \
    -- name flutter-builder-slave \
    flutter-builder