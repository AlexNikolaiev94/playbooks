# Deployment of an eCommerce app (PHP, MariaDB) on AWS EC2

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
5. An AMI of an instance to be used as a NAT. Example configuration of a NAT instance in EC2 can be found [here](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html#nat-routing-table). Specify the AMI id of your NAT instance in the inventory/main.yml

### Running

1. Make sure you are logged in to AWS CLI on the ansible host machine. Since this playbook requires a big list of permissions, it is better to create an IAM user with admin privileges and log in to your AWS CLI as that user.
2. Run `ansible-playbook -i inventory/config_aws_ec2.yml -i inventory/main.yml  -e 'ansible_python_interpreter=/usr/bin/python3' playbook.yml` 
