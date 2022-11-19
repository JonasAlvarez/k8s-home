include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = transmission

.PHONY: deploy
deploy:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl -n $(ENVIRONMENT)-$(APPNAME) get secrets wildcard.sysadm.org || \
		kubectl create secret --namespace $(ENVIRONMENT)-$(APPNAME) \
        		tls wildcard.sysadm.org \
        		--key $(CERT_KEY) --cert $(CERT_CRT)
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -f ./$(APPNAME)-secret.yaml
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -f ./$(ENVIRONMENT).yaml
	@echo "*******************" $@ $(APPNAME) "*******************" end

.PHONY: uninstall
uninstall:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -f ./$(ENVIRONMENT).yaml || true
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -f ./$(APPNAME)-secret.yaml || true
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete secrets --all || true
	@echo "*******************" $@ $(APPNAME) "*******************" end
