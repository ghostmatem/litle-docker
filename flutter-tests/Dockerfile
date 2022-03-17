FROM fischerscode/flutter

USER root:root

ENV APP_PATH=/home/app

WORKDIR ${APP_PATH}

COPY entrypoint.sh .

RUN dart pub global activate junitreport

ENTRYPOINT bash entrypoint.sh
