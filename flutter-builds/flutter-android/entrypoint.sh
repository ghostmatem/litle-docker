#!/bin/bash

set -e

{
   echo "flutter.targetSdkVersion=$ANDROID_VERSION"
   echo "flutter.compileSdkVersion=$ANDROID_VERSION"
   echo "flutter.buildToolsVersion=$ANDROID_BUILD_TOOLS_VERSION"
} > android/local.properties
flutter clean
flutter pub get
flutter build apk
cp build/app/outputs/flutter-apk/* /home/out/