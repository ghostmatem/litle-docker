#!/bin/bash

if [ "$1" == "" ];then
echo "Скрипт требует имя образа!!!"
exit
true
fi

docker run -v /home/alex/projects/out:/home/out -it --rm "$1"
