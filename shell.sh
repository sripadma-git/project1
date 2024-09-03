#!/bin/bash

CONTAINER_NAME="node-docker-app"
IMAGE_NAME="node-docker-app-image"

# Check if the container is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "Container is running. Stopping and removing..."
  docker stop $CONTAINER_NAME
  docker rm $CONTAINER_NAME
fi

# Check if the image exists
if [ "$(docker images -q $IMAGE_NAME)" ]; then
  echo "Image exists. Removing..."
  docker rmi $IMAGE_NAME
fi

# Build the Docker image
docker build -t $IMAGE_NAME .

# Run the Docker container
docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
