Home deployment
===============

## Overview

Applications deployed in my tiny Kubernetes cluster. You can use them at your will.

When executing the command `make deploy-all` from the root, make will loop
through all the application defined in the `APPS` variable from the
`env.<ENVIRONMENT>.mk` file then call the `deploy` target from each application
directory.

You need a few things to install it:
- A kubernetes cluster
- Provide the secret files.
- Execute `make deploy-all`, and you will be done!

And the mini PC is still alive and working:

![All the running kubelets](/_assets/images/kubelets.png)

![The IOS with transmission working](/_assets/images/storage-ios.png)

