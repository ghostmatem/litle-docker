FROM fischerscode/flutter

USER root:root

ENV ANDROID_HOME=sdk/opt/android-sdk-linux
ENV ANDROID_SDK_HOME=${ANDROID_HOME}
ENV ANDROID_SDK_ROOT=${ANDROID_HOME}
ENV ANDROID_SDK=${ANDROID_HOME}

ENV PATH "${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin"
ENV PATH "${PATH}:${ANDROID_HOME}/cmdline-tools/tools/bin"
ENV PATH "${PATH}:${ANDROID_HOME}/tools/bin"
ENV PATH "${PATH}:${ANDROID_HOME}/build-tools/30.0.2"
ENV PATH "${PATH}:${ANDROID_HOME}/platform-tools"
ENV PATH "${PATH}:${ANDROID_HOME}/emulator"
ENV PATH "${PATH}:${ANDROID_HOME}/bin"

ENV APP_PATH=/home/app

WORKDIR ${APP_PATH}

RUN yes "y" | flutter doctor --android-licenses

COPY entrypoint.sh .

EXPOSE 4200

ENTRYPOINT bash entrypoint.sh
