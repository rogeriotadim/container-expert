#! /bin/bash

export MACHINE_NAME=$1

docker-machine create  --driver virtualbox --virtualbox-disk-size "10000" --virtualbox-cpu-count "1" --virtualbox-memory "1024" $MACHINE_NAME
### --engine-env  http_proxy=http://10.16.5.42:3128 --engine-env https_proxy=http://10.16.5.42:3128

docker-machine env $MACHINE_NAME >./$MACHINE_NAME.env

eval "$(docker-machine env $MACHINE_NAME)"