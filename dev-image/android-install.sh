#!/bin/bash
export DEV_ROOT=/home/dev-tools
export ANDROID_HOME=$DEV_ROOT/Android/SDK
export ANDROID_SDK_HOME=$ANDROID_HOME
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_COMMAND_TOOLS=$ANDROID_HOME/cmdline-tools
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
export PATH="$PATH:$ANDROID_SDK_ROOT/platforms"
export PATH="$PATH:$ANDROID_SDK_ROOT/bin"

export JAVA_VERSION="11"

apt-get update && apt-get install --yes --no-install-recommends \
    nano tree openjdk-$JAVA_VERSION-jre-headless wget zip unzip

export ANDROID_COMMAND_TOOLS_PATH="commandlinetools-linux-8092744_latest.zip"
export ANDROID_COMMAND_TOOLS_URL="https://dl.google.com/android/repository/$ANDROID_COMMAND_TOOLS_PATH"

wget $ANDROID_COMMAND_TOOLS_URL \
    && mkdir -p $ANDROID_COMMAND_TOOLS \
    && unzip $ANDROID_COMMAND_TOOLS_PATH -d $ANDROID_COMMAND_TOOLS \
    && mv $ANDROID_COMMAND_TOOLS/cmdline-tools $ANDROID_COMMAND_TOOLS/tools \
    && rm $ANDROID_COMMAND_TOOLS_PATH

sdkmanager --lisenses
sdkmanager "build-tools;33.0.0-rc2" "platform-tools" "platforms;android-31" "cmdline-tools;latest"

