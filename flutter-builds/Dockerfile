FROM android-sdk:clear

ENV FLUTTER_HOME     $DEV_ROOT/flutter
ENV FLUTTER_SDK      $FLUTTER_HOME/flutter-sdk
ENV PORT             80
ENV APP_PATH         $FLUTTER_HOME/app

ENV PATH="${PATH}:$FLUTTER_SDK"
ENV PATH="${PATH}:$FLUTTER_SDK/bin"
ENV PATH="${PATH}:$FLUTTER_SDK/bin/cache/dart-sdk"
ENV PATH="${PATH}:$FLUTTER_SDK/bin/cache/dart-sdk/bin"

# Installing auxiliary packages
RUN apt-get update && \
    apt-get install --yes --no-install-recommends -y \
    bash curl file git zip libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

ARG flutterVersion=stable

ADD https://api.github.com/repos/flutter/flutter/compare/${flutterVersion}...${flutterVersion} /dev/null

RUN mkdir -p $FLUTTER_SDK \
  && git clone https://github.com/flutter/flutter.git -b ${flutterVersion} $FLUTTER_SDK

RUN flutter precache \
  && flutter config --no-analytics \
  && flutter doctor \
  && yes='Y' | flutter doctor --android-licenses

COPY entrypoint.sh $FLUTTER_HOME/

RUN mkdir $APP_PATH && cd $APP_PATH/

EXPOSE ${PORT}

ENTRYPOINT bash entrypoint.sh