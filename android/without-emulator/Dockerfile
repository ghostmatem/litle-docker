FROM ubuntu:20.04

# Enviroments
ENV DEV_ROOT                        home/dev-tools
ENV ANDROID_HOME                    $DEV_ROOT/Android/SDK
ENV ANDROID_SDK_HOME                $ANDROID_HOME
ENV ANDROID_SDK_ROOT                $ANDROID_HOME
ENV ANDROID_SDK                     $ANDROID_HOME

# Java install config
ENV JAVA_VERSION                    11

# Open - jdk
RUN apt update && apt install openjdk-$JAVA_VERSION-jre-headless \ 
    && rm -rf /var/lib/{apt,dpkg,cache,log}

# Android install config
ENV ANDROID_COMMAND_TOOLS_URL       https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
ENV ANDROID_VERSION                 30
ENV ANDROID_BUILD_TOOLS_VERSION     28.0.3
ENV ANDROID_PLATFORM_TOOLS_VERSION  28.0.3

# Android - sdk
RUN wget $ANDROID_COMMAND_TOOLS_URL \
    && mkdir -p $ANDROID_HOME \
    && unzip commandlinetools-linux-6200805_latest.zip -d $ANDROID_HOME \
    && export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH" \
        && sdkmanager --sdk_root=${ANDROID_HOME} "tools" \
        && sdkmanager --update \
        && sdkmanager --list \
        && yes="y" | sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" "tools"\
        && yes="y" | sdkmanager "platform-tools;$ANDROID_PLATFORM_TOOLS_VERSION" "tools"\
        && yes="y" | sdkmanager "platforms;android-$ANDROID_VERSION" "tools" \
        && yes="y" | sdkmanager --licenses \
        && yes="y" | apt install gradle