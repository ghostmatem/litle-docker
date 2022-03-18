#!/bin/bash

path_root='/home/alex/projects/litle-docker'
app=$path_root/app

yes='y' | rm -r $app
mkdir -p $app
git clone https://github.com/ghostmatem/hello-world-app.git $app
docker run -it --rm -v $app:/home/app flutter-builder
