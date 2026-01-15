#!/bin/bash

set -e

echo "🛑 Stopping WordPress + MySQL deployment..."
echo ""

# Delete namespace (which deletes all resources inside)
kubectl delete namespace wordpress

echo ""
echo "✅ Deployment stopped and cleaned up!"
echo ""
echo "💡 Note: Persistent volumes have been deleted. To keep data, manage PVs separately."
