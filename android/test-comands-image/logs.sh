#!/bin/bash

(tree -L 3 "$ANDROID_SDK_ROOT" && echo " " && \
env | grep "PATH\|ANDROID_HOME\|ANDROID_SDK_ROOT\|ANDROID_SDK\|ANDROID_SDK_HOME") \
 > logs.txt
