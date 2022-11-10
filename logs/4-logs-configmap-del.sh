#/bin/bash
if [ $# -eq 0 ]
  then
    echo "Error: no namespace"
    exit 1
fi
NAMESPACE=$1

source secret-env.sh
cat 4-logs-configmap.yaml.template | \
	envsubst \$PROM_URL,\$PROM_USER,\$PROM_PASS,\$LOGS_URL,\$LOGS_USER,\$LOGS_PASS \
	| NAMESPACE=pro-logs /bin/sh -c 'kubectl delete -n $NAMESPACE -f -'
