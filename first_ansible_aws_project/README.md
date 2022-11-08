# Deployment of an eCommerce app (PHP, MariaDB) on AWS EC2

## Overview

This is a playbook for deploying [a simple eCommerce application](https://github.com/kodekloudhub/learning-app-ecommerce) on AWS using:
- an EC2 instance as a web server for a PHP application
- a MariaDB/MySQL RDS instance for database
- an Auto-Scaling Group and Application Load Balancer
- Route53 record for domain name

### Prerequisites
1. AWS CLI (latest)
2. Python3 and dependencies (boto, boto3)
3. Ansible
