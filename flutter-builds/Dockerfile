FROM android-sdk

ENV FLUTTER_HOME     $DEV_ROOT/flutter
ENV PORT             80
ENV APP_PATH         $FLUTTER_HOME/app

ENV PATH="${PATH}:$FLUTTER_HOME/flutter-sdk/bin"
ENV PATH="${PATH}:$FLUTTER_HOME/flutter-sdk/bin/cache/dart-sdk/bin"

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    -y bash curl file git zip libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

WORKDIR $FLUTTER_HOME

ARG flutterVersion=stable

ADD https://api.github.com/repos/flutter/flutter/compare/${flutterVersion}...${flutterVersion} /dev/null

RUN git clone https://github.com/flutter/flutter.git -b ${flutterVersion} flutter-sdk \
  && flutter-sdk/bin/flutter precache \
  && flutter-sdk/bin/flutter config --no-analytics

RUN flutter doctor 

COPY entrypoint.sh $FLUTTER_HOME/

RUN mkdir $APP_PATH && cd $APP_PATH/

EXPOSE ${PORT}

ENTRYPOINT bash entrypoint.sh
