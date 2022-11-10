include ../common.mk
include ../env.$(ENVIRONMENT).mk

.PHONY: check
check:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl apply --validate=true --dry-run=client --filename=.
	@echo "*******************" $@ $(APPNAME) "*******************" end

.PHONY: deploy
deploy:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl apply -f .
	@echo "*******************" $@ $(APPNAME) "*******************" end

.PHONY: uninstall
uninstall:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	kubectl delete -f . || true; \
	exit 0
	@echo "*******************" $@ $(APPNAME) "*******************" end
