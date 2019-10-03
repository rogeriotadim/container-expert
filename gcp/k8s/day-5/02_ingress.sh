#!/bin/bash

host=$1

sed -i "s/gereba01/$host/g" *-ingress.yaml

kubectl create -f app-ingress.yaml
kubectl create -f nginx-ingress.yaml
