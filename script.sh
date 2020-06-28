#!/bin/bash

if [ -f /root/network-policy/namespace.yaml ]; then
   kubectl create -f namespace.yaml
else 
  echo "File not found."
  exit 0
fi
echo ""
echo -n "Changing Namespace..."
sleep 1
echo ""
kubectl config set-context $(kubectl config current-context) --namespace=network
echo ""
sleep 1 
echo -n "Namespace changed default to network"
complete -F __start_kubectl k
echo ""
kubectl config view --flatten --minify | grep namespace:
