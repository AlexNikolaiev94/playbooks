#!/bin/bash
sudo yum update -y
# Install SSM agent to perform actions on this machine
sudo yum install https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -y
# Download the app source code
sudo yum install git -y
git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
# Set up mariadb client
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --os-type=rhel  --os-version=7 --mariadb-server-version=10.7
sudo rm -rf /var/cache/yum
sudo yum makecache
sudo yum install MariaDB-client -yum
# Enable mariadb service
sudo systemctl enable --now mariadb
# Install webserver dependencies
sudo amazon-linux-extras install nginx1
sudo amazon-linux-extras enable php8.0
yum clean metadata
sudo yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y
sudo yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y
sudo systemctl start nginx 
sudo systemctl enable nginx
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
