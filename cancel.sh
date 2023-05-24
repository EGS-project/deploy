#! /bin/sh -eux


kubectl delete -f infra.yaml
kubectl delete -f deployment.yaml