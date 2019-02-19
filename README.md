# Go Health: From Scratch
## The Problem:
When running in Kubernetes, a pod must be able to report on its own health.
This can be done with a REST endpoint, or via more direct commands.
When running Kubernetes with the Istio service mesh, with mTLS enabled, Kubernetes is not able to make an mTLS connection to a health REST endpoint.
To get around this, you can configure Kubernetes liveness/health probes to run an exec command.
Traditionally, this command would require a shell to run.
In the Docker scratch image, there is no shell.

## The Solution
This project provides a scratch+ Docker image, which contains a simple Go binary which can be configured to hit the /health endpoint of a microservice, and report the results.