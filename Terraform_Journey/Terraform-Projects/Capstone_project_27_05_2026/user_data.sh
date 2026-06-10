#!/bin/bash
apt update -y
apt install -y nginx npm nodejs git
systemctl start nginx
systemctl enable nginx