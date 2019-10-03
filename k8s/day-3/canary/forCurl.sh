#!/bin/bash
for i in {1..60}
do
  GET=$(curl -s 10.109.51.249)
  echo "$i - $GET";
  sleep 1;
done
