# Deployment of an eCommerce app (PHP, MariaDB) on AWS EC2

## Overview

This is a playbook for deploying [a simple eCommerce application](https://github.com/kodekloudhub/learning-app-ecommerce) built using PHP and MariaDB on AWS EC2 instances with certain adjustments, like provisioning the instances, using EC2 Security Groups instead of configuring firewalld etc.

### Prerequisites
1. AWS CLI (latest)
2. Python3 and dependencies (boto, boto3)
3. Ansible

### Setup

1. Execute the `credentials_setup.sh` script and provide your AWS Access Key and AWS Secret Key to store those in Ansible Vault for use in playbooks. (You might need to do `chmod +x credentials_setup.sh` first)
   Note: **DO NOT** use your root account credentials! The best practice would be creating a dedicated user in IAM with sufficient EC2 permissions. You should be logged in as this user in your AWS CLI as well.
2. 