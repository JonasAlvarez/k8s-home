include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = kube-hunter

.PHONY: deploy
deploy:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl apply -f cronjob.yaml
	@echo "*******************" $@ $(APPNAME) "*******************" end

.PHONY: uninstall
uninstall:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl delete -f cronjob.yaml || true
	@echo "*******************" $@ $(APPNAME) "*******************" end
