include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = mysql
VAULT_PATH = /home/kube-data/$(APPNAME)

.PHONY: deploy
deploy:
	 @echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -f $(VAULT_PATH)/$(APPNAME)-secret.yaml && \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -f ./$(ENVIRONMENT).yaml
	 @echo "*******************" $@ $(APPNAME) "*******************" end

.PHONY: uninstall
uninstall:
	 @echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -f ./$(ENVIRONMENT).yaml || true; \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -f $(VAULT_PATH)/$(APPNAME)-secret.yaml && \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete deployment,daemonsets,svc,pod,secrets --all || true ; \
	exit 0
	 @echo "*******************" $@ $(APPNAME) "*******************" end
