#!bin/bash

git clone $GIT_LINK ./project
cd ./project
flutter clean
flutter pub get
flutter test --machine | ~/.pub-cache/bin/tojunit > test-report.xml
cat test-report.xml
alex@alex-server:~/projects/flutter-docker/docker-for-tests$
