# Safety net, make sure we are using the correct kubectl context before
# deploying anything
KUBE_CONTEXT ?= default

# Azure Keyvault name where secrets are stored (ie: cloudflare password)
#AZURE_KEY_VAULT_NAME ?= my-infra

# Applications to deploy, order is important
# jellyfin replaces plex, that I not longer have runnig
# mysql disabled, I use the mysql for wordpress only, in this moment
APPS = \
	namespaces \
	pihole \
	transmission \
	web-static \
	kubernetes-dashboard \
	jellyfin \
	wireguard \
	homer

APPS_UNINSTALL = \
	web-static \
	wireguard \
	jellyfin \
	kubernetes-dashboard \
	homer \
	transmission \
	pihole \
	namespaces

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
