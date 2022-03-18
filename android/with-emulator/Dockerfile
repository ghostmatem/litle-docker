FROM ubuntu:20.04

# Enviroments
ENV DEV_ROOT                        /home/dev-tools
ENV ANDROID_HOME                    $DEV_ROOT/Android/SDK
ENV ANDROID_SDK_HOME                $ANDROID_HOME
ENV ANDROID_SDK                     $ANDROID_HOME
ENV ANDROID_SDK_ROOT                $ANDROID_HOME
ENV ANDROID_COMMAND_TOOLS           $ANDROID_HOME/cmdline-tools

ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin"
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin"
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/tools/bin"
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/platform-tools"
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/platforms"
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/emulator"
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/bin"




# Java install
ENV JAVA_VERSION                    11

RUN apt-get update && apt-get install --yes --no-install-recommends \ 
    openjdk-$JAVA_VERSION-jre-headless wget unzip


# Android - command-tools install
ENV ANDROID_COMMAND_TOOLS_PATH      commandlinetools-linux-8092744_latest.zip
ENV ANDROID_COMMAND_TOOLS_URL       https://dl.google.com/android/repository/$ANDROID_COMMAND_TOOLS_PATH

RUN wget $ANDROID_COMMAND_TOOLS_URL \
    && mkdir -p $ANDROID_COMMAND_TOOLS \
    && unzip $ANDROID_COMMAND_TOOLS_PATH -d $ANDROID_COMMAND_TOOLS \
    && mv $ANDROID_COMMAND_TOOLS/cmdline-tools $ANDROID_COMMAND_TOOLS/tools \
    && rm $ANDROID_COMMAND_TOOLS_PATH


# Android install build-tools
ENV ANDROID_VERSION                 30
ENV ANDROID_BUILD_TOOLS_VERSION     30.0.2
ENV ANDROID_ARCHITECTURE            x86_64

# ex   ;30.0.4
ENV ANDROID_PLATFORM_TOOLS_VERSION=""
ENV PATH="${PATH}:${ANDROID_SDK_ROOT}/build-tools/${ANDROID_BUILD_TOOLS_VERSION}"

RUN yes | sdkmanager --licenses \
    && yes | sdkmanager --update \
    && yes | sdkmanager "platforms;android-$ANDROID_VERSION"  \
      "build-tools;$ANDROID_BUILD_TOOLS_VERSION" \
      "platform-tools$ANDROID_PLATFORM_TOOLS_VERSION" \
      "tools" \
      "emulator" \
      "system-images;android-$ANDROID_VERSION;google_apis_playstore;$ANDROID_ARCHITECTURE"


# Gradle install
RUN apt-get --yes --no-install-recommends install gradle \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

# /home/dev-tools/Android/SDK/cmdline-tools/bin

# path -  export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools:$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools:$PATH" \