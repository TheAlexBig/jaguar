#!/bin/bash

# Perform a Git pull
git pull

# Update Git submodules
git submodule update --remote --merge

# Stop Docker Compose services
sudo docker-compose stop

# Clean up Docker resources
sudo docker system prune -f

# Start Docker Compose with cleanup and build
sudo docker-compose up --remove-orphans --build