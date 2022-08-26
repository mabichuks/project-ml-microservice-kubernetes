#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=chukwumamabi/project-ml-microservice-kubernetes:v1.0.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-docker-devops  --image=$dockerpath --port=80 --labels app=udacity-docker-devops 


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-docker-devops  8000:80

