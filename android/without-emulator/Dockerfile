FROM ubuntu:20.04

# Enviroments
ENV DEV_ROOT                        home/dev-tools
ENV ANDROID_HOME                    $DEV_ROOT/Android/SDK
ENV ANDROID_SDK_HOME                $ANDROID_HOME
ENV ANDROID_SDK_ROOT                $ANDROID_HOME
ENV ANDROID_SDK                     $ANDROID_HOME
ENV ANDROID_SDK_MANAGER             $ANDROID_HOME/bin

# Java install config
ENV JAVA_VERSION                    11

# Open - jdk
RUN apt-get update && apt-get install --yes --no-install-recommends \ 
    openjdk-$JAVA_VERSION-jre-headless wget unzip \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

# Android install config
ENV ANDROID_COMMAND_TOOLS_PATH      commandlinetools-linux-8092744_latest.zip
ENV ANDROID_COMMAND_TOOLS_URL       https://dl.google.com/android/repository/$ANDROID_COMMAND_TOOLS_PATH
ENV ANDROID_VERSION                 latest
ENV ANDROID_BUILD_TOOLS_VERSION     latest
ENV ANDROID_PLATFORM_TOOLS_VERSION  latest

# Android - sdk
RUN wget $ANDROID_COMMAND_TOOLS_URL \
    && mkdir -p $ANDROID_HOME \
    && unzip $ANDROID_COMMAND_TOOLS_PATH -d $ANDROID_HOME \
    && rm $ANDROID_COMMAND_TOOLS_PATH \
    && export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH" \
        && $ANDROID_SDK_MANAGER/sdkmanager --sdk_root=${ANDROID_HOME} "tools" \
        && $ANDROID_SDK_MANAGER/sdkmanager --update \
        && $ANDROID_SDK_MANAGER/sdkmanager --list \
        && yes="y" | $ANDROID_SDK_MANAGER/sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" "tools"\
        && yes="y" | $ANDROID_SDK_MANAGER/sdkmanager "platform-tools;$ANDROID_PLATFORM_TOOLS_VERSION" "tools"\
        && yes="y" | $ANDROID_SDK_MANAGER/sdkmanager "platforms;android-$ANDROID_VERSION" "tools" \
        && yes="y" | $ANDROID_SDK_MANAGER/sdkmanager --licenses \
        && yes="y" | apt install gradle
