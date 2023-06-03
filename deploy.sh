#! /bin/sh
NAMESPACE=egs-conv

# load secrets
kubectl create secret generic localstack-secrets --from-env-file=localstack/localstack-secrets.env -n ${NAMESPACE}
kubectl create secret generic mysql-secrets --from-env-file=mysql/mysql-secrets.env -n ${NAMESPACE}
kubectl create secret generic activemq-secrets --from-env-file=activemq/activemq-secrets.env -n ${NAMESPACE}
kubectl create secret generic auth0-secrets --from-env-file=auth0/auth0-secrets.env -n ${NAMESPACE}
kubectl create secret generic composer-secrets --from-env-file=composer/composer-secrets.env -n ${NAMESPACE}

# load configmaps
kubectl create configmap localstack-configmap --from-env-file=localstack/localstack-configmap.env -n ${NAMESPACE}
kubectl create configmap mysql-configmap --from-env-file=mysql/mysql-configmap.env -n ${NAMESPACE}
kubectl create configmap activemq-configmap --from-env-file=activemq/activemq-configmap.env -n ${NAMESPACE}
kubectl create configmap auth0-configmap --from-env-file=auth0/auth0-configmap.env -n ${NAMESPACE}
kubectl create configmap composer-configmap --from-env-file=composer/composer-configmap.env -n ${NAMESPACE}
kubectl create configmap conversion-configmap --from-env-file=conversion/conversion-configmap.env -n ${NAMESPACE}
kubectl create configmap s3connector-configmap --from-env-file=s3connector/s3connector-configmap.env -n ${NAMESPACE}
kubectl apply -f mysql/mysql-db-configmap.yaml -n ${NAMESPACE}

kubectl apply -f dns_configs/localstack-ndots-configmap.yaml -n ${NAMESPACE}
kubectl apply -f dns_configs/composer-ndots-configmap.yaml -n ${NAMESPACE}
kubectl apply -f dns_configs/web-ndots-configmap.yaml -n ${NAMESPACE}


# deploy infrastructure
kubectl apply -f localstack/localstack.yaml
kubectl apply -f activemq/activemq.yaml
kubectl apply -f mysql/mysql.yaml
# deploy app
kubectl apply -f composer/composer.yaml
kubectl apply -f conversion/conversion.yaml
kubectl apply -f s3connector/s3connector.yaml
kubectl apply -f web/web.yaml
kubectl apply -f notification/notification.yaml
# deploy traefik
kubectl apply -f traefik/traefik.yaml

