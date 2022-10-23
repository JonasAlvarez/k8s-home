# Common variables shared accross Makefiles
SHELL := bash -eo pipefail

ENVIRONMENT=pro

CERT_KEY=/home/kube-data/cert-manual/mnt/privkey.pem
CERT_CRT=/home/kube-data/cert-manual/mnt/fullchain.pem

#SECRET_SHOW := az keyvault secret show --vault-name $(AZURE_KEY_VAULT_NAME) --query 'value' -o tsv --name
