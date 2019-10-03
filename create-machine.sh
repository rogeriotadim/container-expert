#!/bin/bash
export http_proxy=http://10.16.5.42:3128
export https_proxy=http://10.16.5.42:3128

docker-machine create \
   --engine-env http_proxy=http://10.16.5.42:3128 --engine-env https_proxy=http://10.16.5.42:3128 \
   --driver virtualbox --virtualbox-disk-size "10000" --virtualbox-cpu-count "1" --virtualbox-memory "1024" $MN

docker-machine env $MN >./$MN.environment

eval "$(docker-machine env $MN)"