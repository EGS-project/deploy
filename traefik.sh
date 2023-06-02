# #! /bin/sh 
TRAEFIK_NAMESPACE=kube-system
TRAEFIK_APP=traefik-7c684877b7-fk5pl
PROJECT_NAMESPACE=egs-conv

kubectl logs ${TRAEFIK_APP} -n ${TRAEFIK_NAMESPACE} | grep ${PROJECT_NAMESPACE}

