# Static Website Deployment on AWS EC2 using Nginx

## Project Overview

This project demonstrates the deployment of a static website on an AWS EC2 instance running Ubuntu Linux and Nginx.

The objective was to simulate a real-world cloud deployment workflow by:

* Creating a secure networking environment using AWS VPC
* Launching an EC2 instance inside a public subnet
* Configuring security groups for web traffic
* Deploying a static website using Nginx
* Verifying public accessibility through the EC2 Public IP
* Performing operational validation checks

---

## Architecture Diagram

![Architecture Diagram](screenshots/architecture-diagram.jpeg)

---

## Solution Architecture

The deployment consists of the following AWS components:

### Virtual Private Cloud (VPC)

A custom VPC was created to provide network isolation for cloud resources.

### Public Subnet

The EC2 instance was launched inside a public subnet, allowing communication with the internet.

### Internet Gateway (IGW)

An Internet Gateway was attached to the VPC to enable inbound and outbound internet connectivity.

### Security Group

The security group acts as a virtual firewall and allows:

| Port | Protocol | Purpose          |
| ---- | -------- | ---------------- |
| 22   | TCP      | SSH Access       |
| 80   | TCP      | HTTP Web Traffic |

### Amazon EC2

The EC2 instance hosts the web server and website files.

### Nginx

Nginx serves the static website content to users accessing the public IP address.

---

## Architecture Flow

1. User enters the EC2 Public IP in a browser.
2. Request reaches the Internet Gateway.
3. Traffic is routed to the Public Subnet.
4. Security Group evaluates inbound rules.
5. Request reaches the EC2 instance.
6. Nginx processes the request.
7. Website files are served back to the user.

---

## Project Tasks

### Task 1: Download Website Source Code

The website source code was downloaded and extracted on the EC2 server.

```bash
unzip -o site.zip
ls -la
```

---

### Task 2: Ownership Proof Modification

The footer section was modified to include deployment ownership proof.

#### Original Footer

```html
<p>Crafted with <span>cloud</span> excellence by Pravin Mishra</p>
```

#### Updated Footer

```html
<p>Crafted with <span>cloud</span> excellence by Pravin Mishra</p>
<p><strong>Deployed by:</strong> DMI Cohort 3 | Samuel Omojiade | Group X | Week 1 | 04-06-2026</p>
```

---

### Task 3: Install and Configure Nginx

#### Update Packages

```bash
sudo apt update
```

#### Install Nginx

```bash
sudo apt install nginx -y
```

#### Start Nginx

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

---

### Task 4: Deploy Website Files

#### Remove Default Nginx Page

```bash
sudo rm -rf /var/www/html/*
```

#### Copy Website Files

```bash
sudo cp -r website/* /var/www/html/
```

#### Restart Nginx

```bash
sudo systemctl restart nginx
```

---

### Task 5: Verify Website Deployment

Access the website using:

```text
http://<EC2-Public-IP>
```

Expected Result:

* Website loads successfully
* Footer proof is visible
* Public access confirmed

---

## Validation Checks

### Verify Nginx Configuration

```bash
sudo nginx -t
```

Expected Output:

```text
syntax is ok
test is successful
```

---

### Verify Nginx Service Status

```bash
sudo systemctl status nginx
```

Expected Output:

```text
Active: active (running)
```

---

### Verify HTTP Access


Expected Result:

Website HTML content is returned.

---

## Acceptance Criteria

| Requirement                   | Status |
| ----------------------------- | ------ |
| Website deployed on EC2       | ✅      |
| Publicly accessible           | ✅      |
| Ownership proof displayed     | ✅      |
| Nginx configuration validated | ✅      |
| Nginx service running         | ✅      |
| Architecture documented       | ✅      |

---

## Skills Demonstrated

* AWS VPC Fundamentals
* Public Subnet Configuration
* Internet Gateway Configuration
* Security Group Management
* Linux Server Administration
* Nginx Web Server Deployment
* Static Website Hosting
* Infrastructure Documentation
* Basic DevOps Operations


## Author

Samuel Omojiade

DevOps Micro Internship (DMI) Cohort 3

AWS Cloud & DevOps Engineer

