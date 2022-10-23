# Safety net, make sure we are using the correct kubectl context before
# deploying anything
KUBE_CONTEXT ?= default

# Azure Keyvault name where secrets are stored (ie: cloudflare password)
#AZURE_KEY_VAULT_NAME ?= my-infra

# Applications to deploy, order is important
# pending review limit-ranges, see original
APPS = \
	namespaces \
	pihole \
	transmission \
	mysql \
	plex \
	web-static \
	kubernetes-dashboard \
	homer

APPS_UNINSTALL = \
	web-static \
	plex \
	kubernetes-dashboard \
	homer \
	mysql \
	transmission \
	pihole \
	namespaces

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
