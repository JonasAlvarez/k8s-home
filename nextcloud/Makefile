include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = nextcloud

.PHONY: deploy
deploy:
	(kubectl -n $(ENVIRONMENT)-$(APPNAME) get secrets wildcard.sysadm.org || \
		kubectl create secret --namespace $(ENVIRONMENT)-$(APPNAME) \
        		tls wildcard.sysadm.org \
        		--key $(CERT_KEY) --cert $(CERT_CRT) ) && \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) apply -k ./

.PHONY: uninstall
uninstall:
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete -k ./ || true; \
	kubectl -n $(ENVIRONMENT)-$(APPNAME) delete deployment,daemonsets,svc,pod,secrets --all || true ; \
	exit 0
