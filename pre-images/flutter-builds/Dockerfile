FROM fischerscode/flutter

USER root:root

ENV APP_PATH=/home/app

WORKDIR ${APP_PATH}

RUN yes "y" | flutter doctor --android-licenses

COPY entrypoint.sh .

EXPOSE 4200

ENTRYPOINT bash entrypoint.sh
