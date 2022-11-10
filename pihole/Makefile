include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = pihole
VAULT_PATH = /home/kube-data/$(APPNAME)

.PHONY: check
check:
	kubectl apply --validate=true --dry-run=client --filename=./$(ENVIRONMENT).yaml

.PHONY: deploy
deploy:
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -f $(VAULT_PATH)/$(APPNAME)-secret.yaml && \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -f ./$(ENVIRONMENT).yaml

.PHONY: uninstall
uninstall:
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -f ./$(ENVIRONMENT).yaml || true; \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -f $(VAULT_PATH)/$(APPNAME)-secret.yaml && \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete deployment,daemonsets,svc,pod,secrets --all || true ; \
	exit 0
