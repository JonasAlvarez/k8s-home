include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = kubernetes-dashboard
VAULT_PATH = /home/kube-data/$(APPNAME)

.PHONY: deploy
deploy:
	 @echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl -n $(APPNAME) get secrets wildcard.sysadm.org || \
		kubectl create secret --namespace $(APPNAME) \
        		tls wildcard.sysadm.org --key $(CERT_KEY) --cert $(CERT_CRT)
	kubectl -n $(APPNAME) get secrets kubernetes-dashboard-certs || \
		kubectl -n $(APPNAME) create secret generic kubernetes-dashboard-certs \
			--from-file=$(VAULT_PATH)/certs
	kubectl -n $(APPNAME) apply -f ./$(ENVIRONMENT).yaml
	kubectl -n $(APPNAME) apply -f ./$(ENVIRONMENT)-user.yaml
	kubectl -n $(APPNAME) apply -f ./$(ENVIRONMENT)-ingress.yaml
	echo Obtain the token with kubectl -n kubernetes-dashboard create token jonas
	@echo "*******************" $@ $(APPNAME) "*******************" end

.PHONY: uninstall
uninstall:
	 @echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl -n $(APPNAME) delete -f ./$(ENVIRONMENT)-ingress.yaml || true; \
	kubectl -n $(APPNAME) delete -f ./$(ENVIRONMENT)-user.yaml || true; \
	kubectl -n $(APPNAME) delete -f ./$(ENVIRONMENT).yaml || true; \
	kubectl -n $(APPNAME) delete secrets --all || true ; \
	exit 0
	@echo "*******************" $@ $(APPNAME) "*******************" end
