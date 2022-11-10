include ../common.mk
include ../env.$(ENVIRONMENT).mk

.PHONY: check
check:
	kubectl apply --validate=true --dry-run=client --filename=.

.PHONY: deploy
deploy:
	kubectl apply -f .

.PHONY: uninstall
uninstall:
	kubectl delete -f . || true; \
	exit 0
