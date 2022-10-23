Home deployment
===============

> I started with this: https://github.com/fikaworks/deploy-kubernetes-addons-makefile-example

> This method is fairly simple and let you decide what application and which
version can be deployed to a given environment. Configuration can be shared
accross environment. The steps to execute the deployment of an application are
independant from each other which provide flexibility.

> Bear in mind that you can adjust this framework to deploy components that are
unrelated to Kubernetes, for example it can adjusted to apply a Terraform
state.

## Overview

Each application should be stored into its own directory. Each Makefile
contains the instructions to deploy an application to an environment. It can be
kubectl, Azure CLI or anything that can be used to deploy infrastructure
components.

When executing the command `make deploy-all` from the root, make will loop
through all the application defined in the `APPS` variable from the
`env.<ENVIRONMENT>.mk` file then call the `deploy` target from each application
directory.

```
- **Environment files** define what application and which version should be
deployed in a given infrastructure environment
- **Application directories** contain the configuration and the script used to
deploy an application


## Usage

When deploying infrastructure components it is wise to test new settings in a
local or test environment. In the following example, we use
[Minikube][minikube] in order to test new configuration.

```bash
# display help
$ ENVIRONMENT=minikube make help

# start minikube
$ minikube start

# deploy all applications to the development cluster
$ ENVIRONMENT=minikube make deploy-all

# deploy a single application to the minikube cluster
$ ENVIRONMENT=minikube make deploy-nginx-ingress
```

[minikube]: https://github.com/kubernetes/minikube
