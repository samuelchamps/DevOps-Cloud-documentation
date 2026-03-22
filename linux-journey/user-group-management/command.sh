#!/bin/bash

# Create groups
sudo groupadd finance
sudo groupadd engineering
sudo groupadd audit

# Create users and assign groups
sudo useradd -m -g finance seun.olamide
sudo useradd -m -g finance mafe.tope
sudo useradd -m -g engineering adebole.muna
sudo useradd -m -g engineering precious.kola
sudo useradd -m -g audit peace.alabi

# Set passwords
sudo passwd ada
sudo passwd tunde
sudo passwd chioma

# Create project directories
sudo mkdir -p company/finance
sudo mkdir -p company/engineering
sudo mkdir -p company/audit

# Set group ownership
sudo chown :finance company/finance
sudo chown :engineering company/engineering
sudo chown :audit company/audit

# Set permissions
sudo chmod 770 company/finance
sudo chmod 770 company/engineering
sudo chmod 770 company/audit

