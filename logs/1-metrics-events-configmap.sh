#/bin/bash
if [ $# -eq 0 ]
  then
    echo "Error: no namespace"
    exit 1
fi
NAMESPACE=$1

source secret-env.sh
cat 1-metrics-events-configmap.yaml.template | \
	envsubst \$PROM_URL,\$PROM_USER,\$PROM_PASS,\$LOGS_URL,\$LOGS_USER,\$LOGS_PASS \
	| NAMESPACE=pro-logs /bin/sh -c 'kubectl apply -n $NAMESPACE -f -'
