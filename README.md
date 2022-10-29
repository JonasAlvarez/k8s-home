Home deployment
===============

## Overview

Applications deployed in my tiny Kubernetes clustes. You can use them at your will.

When executing the command `make deploy-all` from the root, make will loop
through all the application defined in the `APPS` variable from the
`env.<ENVIRONMENT>.mk` file then call the `deploy` target from each application
directory.

Yo need some things:
- A kubernetes cluster
- Provide the secret files.
- Execute make, and you will be done!
