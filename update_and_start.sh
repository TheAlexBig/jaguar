#!/bin/bash

# Step 1: Perform a Git pull
echo "Step 1: Performing a Git pull"
git pull

# Step 2: Update Git submodules
echo "Step 2: Updating Git submodules"
git submodule update --init --recursive
git submodule foreach 'git checkout main && git pull origin main'

# Step 3: Stop Docker Compose services
echo "Step 3: Stopping Docker Compose services"
sudo docker-compose stop

# Step 4: Clean up Docker resources
echo "Step 4: Cleaning up Docker resources"
sudo docker system prune -f

# Step 5: Start Docker Compose with cleanup and build
echo "Step 5: Starting Docker Compose with cleanup and build"
sudo docker-compose up -d --remove-orphans --build

# Done
echo "Script completed"
