#!/bin/bash
for i in {1..600}
do
  GET=$(curl -s --connect-timeout 3 35.199.106.206)
  echo "$i - $GET";
  sleep 0.1s;
done
