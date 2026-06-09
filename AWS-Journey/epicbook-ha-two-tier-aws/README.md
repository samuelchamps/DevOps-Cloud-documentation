# EpicBook HA Two-Tier Architecture on AWS

## Project Overview

This project demonstrates a highly available two-tier web application architecture on AWS.

The application consists of a simple EpicBook frontend, a Node.js backend API, and an Amazon RDS MySQL database. The web tier is deployed behind an Application Load Balancer and managed by an Auto Scaling Group across multiple Availability Zones.

## Architecture

User → Application Load Balancer → Auto Scaling EC2 Web Servers → Amazon RDS MySQL

## Services Used

- Amazon VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- EC2
- Application Load Balancer
- Target Group
- Auto Scaling Group
- Launch Template
- Custom AMI
- Amazon RDS MySQL Multi-AZ
- Security Groups
- Nginx
- Node.js
- PM2

## Architecture Design

![Architecture Diagram](architecture/architecture-diagram.png)

## Key Features

- Custom VPC with public and private subnets across 2 Availability Zones
- ALB deployed across public subnets
- EC2 web servers managed by Auto Scaling Group
- RDS database deployed in private subnets
- RDS Multi-AZ enabled for high availability
- Least-privilege security group configuration
- PM2 used to keep Node.js backend running
- Launch Template user data used for automated frontend and backend startup
- Instance Refresh used to roll out updated versions
- High availability tested by replacing instances

## Security Group Flow

Internet → ALB Security Group → EC2 Security Group → RDS Security Group

- ALB allows HTTP traffic from the internet
- EC2 allows HTTP only from ALB security group
- RDS allows MySQL only from EC2 security group
- SSH access restricted to my IP

## Application Test

The frontend was accessed through the ALB DNS name.

The frontend successfully loaded book records from the RDS database.

## High Availability Test

One EC2 instance was terminated to test Auto Scaling behavior.

The Auto Scaling Group launched a replacement instance automatically, and the application remained accessible through the ALB.


## Challenges Faced

- Target group initially showed unhealthy targets due to backend startup issues.
- Nginx returned 502 because the Node.js backend was not running.
- PM2 had to be configured to restart the backend after reboot.
- Frontend updates were not reflected immediately because older ASG instances were still serving traffic.
- This was resolved by updating the Launch Template user data and running an Instance Refresh.

## Final Outcome

The project successfully demonstrates a production-style highly available two-tier architecture on AWS.

The application is accessible through the ALB and can read data from the private RDS database.

## Lessons Learned

- Auto Scaling requires instances to be fully replaceable.
- Launch Templates and user data are important for repeatable deployments.
- Health checks help identify broken application instances.
- ALB, ASG, and RDS Multi-AZ are key components of highly available cloud architecture.
- Manual fixes are temporary; automation is the lasting solution.
