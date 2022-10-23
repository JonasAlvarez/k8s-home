include ../common.mk
include ../env.$(ENVIRONMENT).mk

.PHONY: deploy
deploy:
	kubectl apply -f ./$(ENVIRONMENT).yaml

.PHONY: uninstall
uninstall:
	kubectl delete -f ./$(ENVIRONMENT).yaml || true
