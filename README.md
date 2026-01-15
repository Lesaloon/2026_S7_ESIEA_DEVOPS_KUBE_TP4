# WordPress + MySQL on Kubernetes (Minikube)

Simple Kubernetes deployment with WordPress (4 replicas) and MySQL (1 replica) on Minikube.

## Quick Start

```bash
# Start the deployment
./start.sh

# Stop the deployment
./stop.sh
```

## Access WordPress

1. Run `minikube tunnel` in a separate terminal
2. Open http://127.0.0.1 in your browser

## Prerequisites

- Minikube installed and running
- kubectl configured

## What's Included

- **WordPress:** 4 replicas, 6.5.3-php8.2-apache
- **MySQL:** 1 replica, version 5.6
- **Storage:** 5Gi (MySQL) + 10Gi (WordPress)
- **Network:** Ingress on 127.0.0.1

## Files

- `01-namespace.yaml` - Kubernetes namespace
- `02-secrets.yaml` - Database credentials
- `03-pvc.yaml` - Persistent volumes
- `04-mysql-deployment.yaml` - MySQL deployment
- `05-mysql-service.yaml` - MySQL service
- `06-wordpress-deployment.yaml` - WordPress deployment
- `07-wordpress-service.yaml` - WordPress ClusterIP service
- `08-ingress.yaml` - Ingress routing

## Credentials

**MySQL:**

- Root Password: `WpSecure2026!Rand#K8s`
- Database: `wordpress`
- User: `wordpressuser`
- Password: `WordPr2026#Pass`

## Useful Commands

```bash
# Check pod status
kubectl get pods -n wordpress

# View logs
kubectl logs -n wordpress -l app=wordpress

# Delete everything
kubectl delete namespace wordpress
```

## Configuration

Resources are set to minimal values for Minikube:

- **MySQL:** 100m CPU / 128Mi RAM (requests), 250m / 256Mi (limits)
- **WordPress:** 250m CPU / 256Mi RAM (requests), 500m / 512Mi (limits)
