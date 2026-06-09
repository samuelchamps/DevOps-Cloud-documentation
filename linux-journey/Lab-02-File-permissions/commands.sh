#!/bin/bash

# Fix group ownership
sudo chown :finance /home/vagrant/company/finance
sudo chown :engineering /home/vagrant/company/engineering

# Set correct permissions
sudo chmod 770 /home/vagrant/company/finance
sudo chmod 770 /home/vagrant/company/engineering

# (Optional) Ensure users are in correct groups
sudo usermod -aG finance mafe.tope
sudo usermod -aG engineering ben.bisade
