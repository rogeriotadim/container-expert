#! /bin/bash

export MACHINE_NAME=$1

docker-machine create --engine-env  http_proxy=http://10.16.5.42:3128 --engine-env https_proxy=http://10.16.5.42:3128 --driver virtualbox --virtualbox-disk-size "10000" $MACHINE_NAME

docker-machine.exe env $MACHINE_NAME >./$MACHINE_NAME.env
