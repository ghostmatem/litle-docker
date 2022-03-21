#!/bin/bash

###   ####  ####  ####  ####  ####  ###
export FLUTTER_HOME="$DEV_ROOT/flutter"
export FLUTTER_SDK="$FLUTTER_HOME/flutter-sdk"

export PATH="$PATH:$FLUTTER_SDK"
export PATH="$PATH:$FLUTTER_SDK/bin"
export PATH="$PATH:$FLUTTER_SDK/bin/cache/dart-sdk"
export PATH="$PATH:$FLUTTER_SDK/bin/cache/dart-sdk/bin"


apt-get update
apt-get install --yes --no-install-recommends -y bash curl file git libglu1-mesa which xz-utils

export flutterVersion="2.12.0-4.1.pre"

mkdir -p $FLUTTER_SDK \
  && git clone https://github.com/flutter/flutter.git -b ${flutterVersion} $FLUTTER_SDK

flutter config --android-sdk "$ANDROID_SDK_ROOT"
yes | flutter doctor --android-licenses

