## 🚀 Project Overview

This project demonstrates how to deploy a static HTML website on an AWS EC2 instance using a web server (Nginx/Apache).

The goal is to understand:
- EC2 provisioning
- Security group configuration
- Web server setup
- Manual deployment process

Jira was used to track the workflow from planning to deployment.

## 🏗️ Architecture

User → EC2 Instance → Web Server (Nginx) → Static Website

## 🧰 Tools Used

- AWS EC2
- Nginx / Apache
- GitHub
- Jira (for task tracking)
- SSH

## ⚙️ Implementation Steps

### 1. Launch EC2 Instance
- Created an EC2 instance using Ubuntu AMI
- Configured security group:
  - Port 22 (SSH) → My IP
  - Port 80 (HTTP) → Anywhere

### 2. Connect via SSH
- Used SSH to connect to the instance
- Verified access to the server

### 3. Install Web Server
- Installed Nginx
- Started and enabled the service

### 4. Deploy Application
- Cloned repository:
  https://github.com/pravinmishraaws/mini_finance.git
- Copied files to `/var/www/html`
- Restarted Nginx

### 5. Test Deployment
- Accessed EC2 public IP
- Confirmed website loads successfully

## ⚙️ Implementation Steps

### 1. Launch EC2 Instance
- Created an EC2 instance using Ubuntu AMI
- Configured security group:
  - Port 22 (SSH) → My IP
  - Port 80 (HTTP) → Anywhere

### 2. Connect via SSH
- Used SSH to connect to the instance
- Verified access to the server

### 3. Install Web Server
- Installed Nginx
- Started and enabled the service

### 4. Deploy Application
- Cloned repository:
  https://github.com/pravinmishraaws/mini_finance.git
- Copied files to `/var/www/html`
- Restarted Nginx

### 5. Test Deployment
- Accessed EC2 public IP
- Confirmed website loads successfully

## 📊 Jira Workflow

Jira was used to track the project lifecycle:

- Created Epics:
  - Project Planning
  - Infrastructure Setup
  - Deployment
  - Testing

- Tasks were moved across:
  To Do → In Progress → Testing → Done

- Bugs were created for issues encountered during deployment


## 🎯 Key Learnings

- How to provision EC2 instances
- Importance of security group configuration
- Basic web server setup
- Debugging real-world deployment issues
- Using Jira to track DevOps workflows
