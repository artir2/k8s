# My Application

This repository contains the Kubernetes manifests for deploying and managing my application using Argo CD.

## Directory Structure

- **`/my-deployment.yaml`**: Deployment configuration for the application.
- **`/my-ingress.yaml`**: Ingress configuration for exposing the application.
- **`/my-service.yaml`**: Service configuration for the application.
- **`/tls-secrets.yaml`**: TLS secret configuration for securing the application.

## Argo CD Integration

### Prerequisites

- **Argo CD Installed**: Ensure that Argo CD is installed in your Kubernetes cluster.
- **Git Repository**: Create a Git repository to store your application manifests.

### Argo CD Application Configuration

The Argo CD application is configured using the following manifest:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
spec:
  destination:
    name: ''  # Kubernetes cluster context
    namespace: 'hackolak'
    server: ''  # Kubernetes cluster API server
  source:
    path: ''  # Path to application manifests within the Git repository
    repoURL: ''  # URL of the Git repository
    targetRevision: HEAD
  project: hack
  syncPolicy:
    automated:
      prune: false
      selfHeal: false
