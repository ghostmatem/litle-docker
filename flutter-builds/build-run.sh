#!bin/bash

set -e

docker build . -t flutter-builder
bash run.sh