#!/bin/bash

set -e

flutter clean
flutter pub get
flutter build apk
mv build/app/outputs/flutter-apk/* home/out/