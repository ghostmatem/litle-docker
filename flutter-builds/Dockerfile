FROM fischerscode/flutter

USER root:root

# Переменнные среды, обозначенные не в начале файла а по ходу его выполнения
# обусловлены особенностями кэширования docker
# Это сделано в целях оптимизации времени ребилда
ENV PORT             80
ENV IMAGE_ROOT       /home
ENV APP_PATH         $IMAGE_ROOT/app
ENV DEBIAN_FRONTEND  noninteractive

ENV JAVA_VERSION     11

# Установка JDK и зависимостей
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
  openjdk-$JAVA_VERSION-jdk \ 
  curl unzip sed git bash xz-utils libglvnd0 ssh xauth x11-xserver-utils \ 
  libpulse0 libxcomposite1 libgl1-mesa-glx sudo \
  && rm -rf /var/lib/{apt,dpkg,cache,log}

# Определение переменных среды андроид
ENV ANDROID_HOME                    $IMAGE_ROOT/SDK
ENV ANDROID_VERSION                 30
ENV ANDROID_SDK_ROOT                $ANDROID_HOME/android
ENV ANDROID_BUILD_TOOLS_VERSION     30.0.2
ENV ANDROID_ARCHITECTURE            x86_64
ENV ANDROID_TOOLS_URL               https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
ENV PATH                            $ANDROID_SDK_ROOT/cmdline-tools/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/platforms:$PATH"

# Установка Android SDK
RUN mkdir -p $ANDROID_SDK_ROOT \
  && mkdir -p $ANDROID_HOME/.android \
  && touch $ANDROID_HOME/.android/repositories.cfg \
  && curl -o android_tools.zip $ANDROID_TOOLS_URL \
  && unzip -qq -d $ANDROID_SDK_ROOT android_tools.zip \
  && rm android_tools.zip \
  && yes "y" | sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" \
  && yes "y" | sdkmanager "platforms;android-$ANDROID_VERSION" \
  && yes "y" | sdkmanager "platform-tools" \
  && yes "y" | sdkmanager "emulator" \
  && yes "y" | sdkmanager "system-images;android-$ANDROID_VERSION;google_apis_playstore;$ANDROID_ARCHITECTURE"

# Принятие лицензии и реконфиг flutter
RUN flutter config --no-analytics \
  && flutter precache \
  && yes "y" | flutter doctor --android-licenses \
  && flutter doctor \
  && flutter emulators --create \
  && flutter update-packages

COPY entrypoint.sh $IMAGE_ROOT/

RUN mkdir $APP_PATH && cd $APP_PATH/

EXPOSE ${PORT}

ENTRYPOINT bash entrypoint.sh
