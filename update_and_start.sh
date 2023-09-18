#!/bin/bash

# Change to your Git repository directory
cd /path/to/your/git/repository

# Perform a Git pull
git pull

# Update Git submodules
git submodule update --remote --merge

# Stop Docker Compose services
sudo docker-compose stop

# Start Docker Compose with cleanup and build
sudo docker-compose up --remove-orphans --build