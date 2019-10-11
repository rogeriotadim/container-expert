#!/bin/bash
#
# no_proxy do host deve ter:
# * ip do host
# * 192.168.99.0/8
#
#


minikube start --vm-driver=virtualbox --host-dns-resolver=true \
  --insecure-registry=registry-scm.prevnet \
  --insecure-registry=registry-scm.prevnet:443 \
  --insecure-registry=www-scm.prevnet \
  --insecure-registry=www-scm.prevnet:443 \
  --docker-env HTTP_PROXY="http://10.16.5.42:3128/" \
  --docker-env HTTPS_PROXY="http://10.16.5.42:3128/" \
  --docker-env NO_PROXY="localhost,127.0.0.1,::1,10.16.5.42,10.96.0.0/12,192.168.10.0/24,192.168.99.101,registry-scm.prevnet,registry-git.prevnet,docker-registry-default.apps.prevnet, registry-scm.prevnet"
