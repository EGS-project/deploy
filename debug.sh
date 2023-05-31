#! /bin/sh 
NAMESPACE=s112169

kubectl get pods -n ${NAMESPACE}
kubectl get services -n ${NAMESPACE}
POD=$(kubectl get pods -n ${NAMESPACE} | grep localstack-deployment | awk '{print $1}')
kubectl describe pod ${POD} -n ${NAMESPACE}
kubectl logs ${POD} -n ${NAMESPACE}
