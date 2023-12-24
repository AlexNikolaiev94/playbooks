# Using ansible locally to automate setting up and installation of a fully configured Arch Linux distribution with all the basic packages

## Overview

This is a playbook for deploying [a simple eCommerce application](https://github.com/kodekloudhub/learning-app-ecommerce) on AWS using:
- an EC2 instance as a web server for a PHP application
- a MariaDB/MySQL RDS instance for database
- an Auto-Scaling Group and Application Load Balancer
- Route53 record for domain name

### Prerequisites
1. AWS CLI (latest)
2. `amazon.aws` and `community.aws` collections. Run `ansible-galaxy collection list` to check whether they are installed. If not, run `ansible-galaxy collection install amazon.aws community.aws`.
3. Python3 and dependencies (boto, boto3)
4. Ansible

### Running

1. Make sure you are logged in to AWS CLI on the ansible host machine. Since this playbook requires a big list of permissions, it is better to create an IAM user with admin privileges and log in to your AWS CLI as that user.
2. Run `ansible-playbook -i inventory/config.aws_ec2.yml -i inventory/main.yml -e 'ansible_python_interpreter=/usr/bin/python3' playbook.yml` 
