#!/bin/bash

set -e

echo "Starting WordPress + MySQL deployment on Minikube..."
echo ""

# Enable ingress addon
echo "Enabling Nginx Ingress Controller..."
minikube addons enable ingress
echo ""

# Apply all manifests
echo "Creating Kubernetes resources..."
kubectl apply -f wordpress-deployment/
echo ""

echo "Waiting for MySQL to be ready..."
kubectl wait --for=condition=ready pod -l app=mysql -n wordpress --timeout=300s 2>/dev/null || true

echo "Waiting for WordPress pods to be ready..."
kubectl wait --for=condition=ready pod -l app=wordpress -n wordpress --timeout=300s 2>/dev/null || true
echo ""

echo "Deployment complete!"
echo ""
echo "Access WordPress at:"
minikube service wordpress -n wordpress --url
echo ""
echo "Check status:"
echo "  kubectl get pods -n wordpress"
