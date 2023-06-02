#! /bin/sh -eux
# usage
# ./pod.sh localstack
# ./pod.sh activemq
# ./pod.sh mysql
NAMESPACE=egs-conv
POD_NAME=$1

kubectl get pods -n ${NAMESPACE}
kubectl get services -n ${NAMESPACE}
POD=$(kubectl get pods -n ${NAMESPACE} | grep ${POD_NAME} | awk '{print $1}')
kubectl describe pod ${POD} -n ${NAMESPACE}
kubectl logs ${POD} -n ${NAMESPACE}
kubectl top pods -n ${NAMESPACE}
