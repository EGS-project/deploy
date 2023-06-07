#! /bin/sh 
NAMESPACE=egs-conv

# delete secrets
kubectl delete secret localstack-secrets -n ${NAMESPACE} 
kubectl delete secret mysql-secrets -n ${NAMESPACE} 
kubectl delete secret activemq-secrets -n ${NAMESPACE} 
kubectl delete secret auth0-secrets -n ${NAMESPACE} 
kubectl delete secret composer-secrets -n ${NAMESPACE} 

# delete configmaps
kubectl delete configmap localstack-configmap -n ${NAMESPACE} 
kubectl delete configmap mysql-configmap -n ${NAMESPACE} 
kubectl delete configmap activemq-configmap -n ${NAMESPACE} 
kubectl delete configmap auth0-configmap -n ${NAMESPACE} 
kubectl delete configmap composer-configmap -n ${NAMESPACE} 
kubectl delete configmap conversion-configmap -n ${NAMESPACE} 
kubectl delete configmap s3connector-configmap -n ${NAMESPACE} 
kubectl delete configmap mysql-db-configmap -n ${NAMESPACE}

kubectl delete configmap localstack-ndots-configmap -n ${NAMESPACE}
kubectl delete configmap composer-ndots-configmap -n ${NAMESPACE}
kubectl delete configmap web-ndots-configmap -n ${NAMESPACE}
kubectl delete configmap conversion-ndots-configmap -n ${NAMESPACE}
kubectl delete configmap s3connector-ndots-configmap -n ${NAMESPACE}
kubectl delete configmap notification-ndots-configmap -n ${NAMESPACE}

# delete infrastructure
kubectl delete -f localstack/localstack.yaml
kubectl delete -f activemq/activemq.yaml
kubectl delete -f mysql/mysql.yaml
# delete app
kubectl delete -f composer/composer.yaml
kubectl delete -f conversion/conversion.yaml
kubectl delete -f s3connector/s3connector.yaml
kubectl delete -f web/web.yaml
kubectl delete -f notification/notification.yaml
# delete traefik
kubectl delete -f traefik/traefik.yaml
