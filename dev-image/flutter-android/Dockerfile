FROM android-platforms

ENV FLUTTER_HOME                 $DEV_ROOT/flutter
ENV FLUTTER_SDK                  $FLUTTER_HOME/flutter-sdk
ENV PORT                         80
ENV APP_PATH                     /home/app


ENV PATH="$PATH:$FLUTTER_SDK"
ENV PATH="$PATH:$FLUTTER_SDK/bin"
ENV PATH="$PATH:$FLUTTER_SDK/bin/cache/dart-sdk"
ENV PATH="$PATH:$FLUTTER_SDK/bin/cache/dart-sdk/bin"


RUN apt-get update \
    && apt-get install --yes --no-install-recommends -y \ 
    bash curl file git libglu1-mesa xz-utils


# Flutter install
ENV FLUTTER_VERSION             stable

ADD https://api.github.com/repos/flutter/flutter/compare/${FLUTTER_VERSION}...${FLUTTER_VERSION} /dev/null

RUN mkdir -p $FLUTTER_SDK \
  && git clone https://github.com/flutter/flutter.git -b ${FLUTTER_VERSION} $FLUTTER_SDK

RUN flutter config --android-sdk "$ANDROID_SDK_ROOT" \ 
    && flutter config --no-analytics \
    && yes | flutter doctor --android-licenses

RUN mkdir /home/out

WORKDIR $APP_PATH

COPY entrypoint.sh /home
COPY ../app .

EXPOSE ${PORT}

ENTRYPOINT bash /home/entrypoint.sh