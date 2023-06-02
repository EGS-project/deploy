#! /bin/sh 
# usage
# ./access localstack
# ./access mysql
# ./access activemq

NAMESPACE=egs-conv
POD_NAME=$1

kubectl get pods -n ${NAMESPACE}
kubectl get services -n ${NAMESPACE}
POD=$(kubectl get pods -n ${NAMESPACE} | grep ${POD_NAME} | awk '{print $1}')
kubectl exec -n ${NAMESPACE} -it $POD -- /bin/bash; kubectl exec -n ${NAMESPACE} -it $POD -- /bin/sh
