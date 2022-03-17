FROM fischerscode/flutter

USER root:root

ENV IMAGE_INSTALL_ROOT  /home
ENV APP_PATH            ${IMAGE_INSTALL_ROOT}/app

ENV ANDROID_HOME        ${IMAGE_INSTALL_ROOT}/android-sdk-linux
ENV ANDROID_SDK_HOME    ${ANDROID_HOME}
ENV ANDROID_SDK_ROOT    ${ANDROID_HOME}
ENV ANDROID_SDK         ${ANDROID_HOME}

ENV PORT 80

ENV PATH "${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin"
ENV PATH "${PATH}:${ANDROID_HOME}/cmdline-tools/tools/bin"
ENV PATH "${PATH}:${ANDROID_HOME}/tools/bin"
ENV PATH "${PATH}:${ANDROID_HOME}/build-tools/30.0.2"
ENV PATH "${PATH}:${ANDROID_HOME}/platform-tools"
ENV PATH "${PATH}:${ANDROID_HOME}/emulator"
ENV PATH "${PATH}:${ANDROID_HOME}/bin"
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Установка open-JDK
RUN dpkg --add-architecture i386 && \
    apt-get update -yqq && \
    apt-get install -y curl expect git \ 
    libc6:i386 libgcc1:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386 \ 
    openjdk-11-jdk wget unzip vim && \
    apt-get clean

RUN groupadd android && useradd -d ${ANDROID_HOME} -g android android

COPY tools ${IMAGE_INSTALL_ROOT}/tools
COPY licenses ${IMAGE_INSTALL_ROOT}/licenses

RUN ${IMAGE_INSTALL_ROOT}/tools/entrypoint.sh built-in

# Установка Tools
RUN ${IMAGE_INSTALL_ROOT}/tools/entrypoint.sh built-in && \
    ${ANDROID_HOME}/cmdline-tools/tools/bin/sdkmanager "cmdline-tools;latest" && \
    ${ANDROID_HOME}/cmdline-tools/tools/bin/sdkmanager "build-tools;30.0.2"  && \
    ${ANDROID_HOME}/cmdline-tools/tools/bin/sdkmanager "platform-tools" && \
    ${ANDROID_HOME}/cmdline-tools/tools/bin/sdkmanager "platforms;android-30"

USER root:root

WORKDIR ${APP_PATH}

COPY entrypoint.sh .

EXPOSE ${PORT}

ENTRYPOINT bash entrypoint.sh
