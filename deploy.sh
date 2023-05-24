#! /bin/sh -eux


kubectl apply -f infra.yaml
kubectl apply -f deployment.yaml