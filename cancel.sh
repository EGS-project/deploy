#! /bin/sh 
NAMESPACE=egs-conv

# delete secrets
kubectl delete secret activemq-secrets -n egs-conv 
kubectl delete secret auth0-secrets -n egs-conv
kubectl delete secret composer-secrets -n egs-conv 
kubectl delete secret localstack-secrets -n egs-conv 
kubectl delete secret mysql-secrets -n egs-conv 

# delete configmaps
kubectl delete configmap activemq-configmap -n egs-conv 
kubectl delete configmap auth0-configmap -n egs-conv 
kubectl delete configmap composer-configmap -n egs-conv 
kubectl delete configmap conversion-configmap -n egs-conv 
kubectl delete configmap localstack-configmap -n egs-conv 
kubectl delete configmap mysql-configmap -n egs-conv 
kubectl delete configmap s3connector-configmap -n egs-conv 

# delete deploy
kubectl apply -f activemq/activemq.yaml
kubectl apply -f mysql/mysql.yaml
kubectl apply -f localstack/localstack.yaml