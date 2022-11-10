include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = web-static

.PHONY: deploy
deploy:
	(kubectl -n $(ENVIRONMENT)-$(APPNAME) get secrets wildcard.sysadm.org || \
		kubectl create secret --namespace $(ENVIRONMENT)-$(APPNAME) \
        		tls wildcard.sysadm.org \
        		--key $(CERT_KEY) --cert $(CERT_CRT) ) && \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -f ./$(ENVIRONMENT).yaml

.PHONY: uninstall
uninstall:
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -f ./$(ENVIRONMENT).yaml || true; \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete deployment,daemonsets,svc,pod,secrets --all || true ; \
	exit 0
