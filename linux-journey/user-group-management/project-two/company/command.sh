#!/bin/bash

# Create users
sudo useradd -m -c "Racheal Peters" RPeeters
sudo useradd -m -c "Tracy Adebayo" TAdebayo

# Create groups
sudo groupadd HR
sudo groupadd Finance
sudo groupadd IT

# Add users to groups
sudo usermod -aG HR RPeeters
sudo usermod -aG HR TAdebayo

# Create directories
sudo mkdir -p company/HR company/Finance company/IT

# Set ownership
sudo chown :HR company/HR
sudo chown :Finance company/Finance
sudo chown :IT company/IT

# Set permissions
sudo chmod 770 company/*
sudo chmod g+s company/*
