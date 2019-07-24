#!/bin/bash
kubectl create namespace ingress
kubectl create -f app-svc1.yaml
kubectl create -f app-svc2.yaml
kubectl create -f app1.yaml
kubectl create -f app2.yaml
kubectl create -f default-backend-service.yaml
kubectl create -f default-backend.yaml
kubectl create -f nginx-ingress-controller-clusterrole.yaml
kubectl create -f nginx-ingress-controller-clusterrolebinding.yaml
kubectl create -f nginx-ingress-controller-config-map.yaml
kubectl create -f nginx-ingress-controller-deployment.yaml
kubectl create -f nginx-ingress-controller-service-account.yaml
kubectl create -f nginx-ingress-controller-service.yaml

