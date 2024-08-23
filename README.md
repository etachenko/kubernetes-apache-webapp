## Apache Web Application on Kubernetes
  This README proposes a step-by-step method for an Apache web application mini-project deployed using Kubernetes.
  It shows how to deploy, configure, and manage the application within a Kubernetes cluster.

---

# Apache Web Application on Kubernetes

## Overview
This repository contains the configuration and setup for deploying an Apache web application in a Kubernetes cluster. 
The application is served using an Apache HTTP server and is managed using Kubernetes resources such as deployments and services.

## Prerequisites
Before you begin, ensure you have the following:

- Kubernetes Cluster: A running Kubernetes cluster. You can use a managed service like Amazon EKS
- kubectl: Kubernetes command-line tool installed and configured.
- Docker: For building Docker images (if you need to build custom images).
  
## Setup

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/username/repository.git
   ```

2. **Navigate to the Project Directory**:

   ```bash
   cd repository
   ```

3. **Build Docker Image** (if applicable):

   If you need to build a custom Docker image, use the provided Dockerfile:

   ```bash
   docker build -t your-image-name .
   ```

   Push the image to a container registry (e.g., Docker Hub, AWS ECR):

   ```bash
   docker push your-image-name
   ```

## Configuration

1. **Edit Deployment YAML**:

   Update the Kubernetes deployment YAML file (`deployment.yaml`) with your image details and any environment-specific configurations:

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: apache-app
   spec:
     replicas: 3
     selector:
       matchLabels:
         app: apache-app
     template:
       metadata:
         labels:
           app: apache-app
       spec:
         containers:
         - name: apache-container
           image: your-image-name:latest
           ports:
           - containerPort: 80
   ```

2. **Edit Service YAML**:

   Configure the service to expose your application:

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: apache-service
   spec:
     selector:
       app: apache-app
     ports:
       - protocol: TCP
         port: 80
         targetPort: 80
     type: LoadBalancer
   ```
   

## Deployment

Deploy the application to your Kubernetes cluster:

1. **Apply the Deployment**:

   ```bash
   kubectl apply -f deployment.yaml
   ```

2. **Apply the Service**:

   ```bash
   kubectl apply -f service.yaml
   ```

## Accessing the Application

- **Via LoadBalancer Service**: Obtain the external IP address of the service:

  ```bash
  kubectl get services
  ```

## Scaling

To scale the number of replicas for your application, modify the `replicas` field in the deployment YAML and apply the changes:

```bash
kubectl scale deployment apache-app --replicas=5
```

## Troubleshooting

- **Check Pod Status**:

  ```bash
  kubectl get pods
  ```

- **View Logs**:

  ```bash
  kubectl logs <pod-name>
  ```

- **Describe Resources**:

  ```bash
  kubectl describe deployment apache-app
  kubectl describe service apache-service
  ```

- **Inspect Events**:

  ```bash
  kubectl get events
  ```





  



