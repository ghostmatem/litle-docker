#!/bin/bash

if [ "$1" == '-a' ]; then
docker rmi android:clear
im_here=$(pwd)
cd ../android/without-emulator/
bash build.sh
cd "$im_here"
true
fi

bash build.sh
bash run.sh

