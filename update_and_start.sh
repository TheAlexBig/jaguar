#!/bin/bash

# Step 1: Perform a Git pull
echo "Step 1: Performing a Git pull"
git pull

# Step 2: Update Git submodules
echo "Step 2: Updating Git submodules"
git submodule update --remote --merge

# Step 3: Stop Docker Compose services
echo "Step 3: Stopping Docker Compose services"
sudo docker-compose stop

# Step 4: Clean up Docker resources
echo "Step 4: Cleaning up Docker resources"
sudo docker system prune -f

# Step 5: Remove all stopped containers 
echo "Step 5: Removing all stopped containers"
sudo docker rm $(sudo docker ps -aq)

# Step 6: Start Docker Compose with cleanup and build
echo "Step 6: Starting Docker Compose with cleanup and build"
sudo docker-compose up --remove-orphans --build

# Done
echo "Script completed"