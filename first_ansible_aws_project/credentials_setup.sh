#!/usr/bin/bash

VAR_DIR=group_vars/all
TEMP_DIR=group_vars/templates

read -p 'Access Key ID: ' AWS_ACCESS_KEY
read -p 'Secret Access Key: ' AWS_SECRET

echo 'Generating a random password for the Ansible vault'
openssl rand -base64 2048 > vault.pass
chmod 0600 vault.pass

echo 'Creating a variable file to store AWS credentials'

rm -f $VAR_DIR/credentials.yml temp.yml

( echo "tee ${VAR_DIR}/credentials.yml <<EOF > /dev/null";
  cat $TEMP_DIR/credentials.yml;
) >temp.yml
. temp.yml

echo 'Encrypting the credentials file'

ansible-vault encrypt group_vars/all/credentials.yml --vault-password-file vault.pass

rm -f temp.yml

echo 'Done!'
