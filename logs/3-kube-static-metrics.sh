#/bin/bash
if [ $# -eq 0 ]
  then
    echo "Error: no namespace"
    exit 1
fi
NAMESPACE=$1

#helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && helm repo update && helm install ksm prometheus-community/kube-state-metrics --set image.tag=v2.4.2 -n pro-logs
helm install ksm prometheus-community/kube-state-metrics --set image.tag=v2.4.2 -n $NAMESPACE
