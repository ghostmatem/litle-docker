#!/bin/bash

docker rmi flutter-builder
docker build . -t flutter-builder