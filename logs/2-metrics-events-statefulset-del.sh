#/bin/bash
if [ $# -eq 0 ]
  then
    echo "Error: no namespace"
    exit 1
fi
NAMESPACE=$1

MANIFEST_URL=https://raw.githubusercontent.com/grafana/agent/v0.27.1/production/kubernetes/agent-bare.yaml NAMESPACE=pro-logs /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/grafana/agent/v0.27.1/production/kubernetes/install-bare.sh)" | kubectl delete -f -
