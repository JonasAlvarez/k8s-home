include ../common.mk
include ../env.$(ENVIRONMENT).mk

.PHONY: deploy
deploy:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl apply -f ./$(ENVIRONMENT).yaml
	@echo "*******************" $@ $(APPNAME) "*******************" end

.PHONY: uninstall
uninstall:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl delete -f ./$(ENVIRONMENT).yaml || true
	@echo "*******************" $@ $(APPNAME) "*******************" end
