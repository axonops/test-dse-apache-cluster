#!/bin/bash

# Define variables
IMAGE_NAME="testdsecassandraapp" # Replace with your image name
IMAGE_TAG="1.0"         # Replace with your tag
DOCKERFILE_PATH="."         # Path to the directory with your Dockerfile
NETWORK_NAME="test-dse-apache-cluster_axonops-cassandra" # Docker Compose network name
CONTAINER_NAME="my-app-container" # Name for your new container

# Step 1: Check if the container exists and stop it
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Stopping existing container $CONTAINER_NAME..."
    docker stop $CONTAINER_NAME
fi

# Step 2: Check if the container exists in stopped state and remove it
if [ $(docker ps -a -q -f name=$CONTAINER_NAME) ]; then
    echo "Removing existing container $CONTAINER_NAME..."
    docker rm $CONTAINER_NAME
fi

# Step 3: Check if the image exists and delete it
image=$(docker images -q $IMAGE_NAME:$IMAGE_TAG)
if [ ! -z "$image" ]; then
    echo "Image $IMAGE_NAME:$IMAGE_TAG exists. Deleting..."
    docker rmi -f $IMAGE_NAME:$IMAGE_TAG
fi

# Step 4: Build a new image
echo "Building new Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG $DOCKERFILE_PATH

# Step 5: Run container with new image
echo "Running container from the new image..."
docker run --network $NETWORK_NAME --name $CONTAINER_NAME $IMAGE_NAME:$IMAGE_TAG

echo "Container started successfully."


