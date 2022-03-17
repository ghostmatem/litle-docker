#!bin/bash

git clone $GIT_LINK ./project
cd ./project
flutter clean
flutter pub get
flutter build apk

