include ../common.mk
include ../env.$(ENVIRONMENT).mk

APPNAME = logs
NAMESPACE=$(ENVIRONMENT)-$(APPNAME)

.PHONY: deploy
deploy:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	./1-metrics-events-configmap.sh $(NAMESPACE)
	./2-metrics-events-statefulset.sh $(NAMESPACE)
	./3-kube-static-metrics.sh $(NAMESPACE)
	./4-logs-configmap.sh $(NAMESPACE)
	./5-logs-daemonset.sh $(NAMESPACE)
	@echo "*******************" $@ $(APPNAME) "*******************" end


.PHONY: uninstall
uninstall:
	@echo "*******************" $@ $(APPNAME) "*******************" start
	./1-metrics-events-configmap-del.sh $(NAMESPACE) || true
	./2-metrics-events-statefulset-del.sh $(NAMESPACE) || true
	helm uninstall ksm -n $(NAMESPACE) || true
	./4-logs-configmap-del.sh $(NAMESPACE) || true
	./5-logs-daemonset-del.sh $(NAMESPACE) || true
	exit 0
	@echo "*******************" $@ $(APPNAME) "*******************" end

