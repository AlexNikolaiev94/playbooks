#!/usr/bin/bash

VAR_DIR=group_vars/all
TEMP_DIR=group_vars/templates

read -p 'Access Key ID: ' AWS_ACCESS_KEY
read -p 'Secret Access Key: ' AWS_SECRET

echo 'Generating a random password for the Ansible vault'
openssl rand -base64 2048 > vault.pass
chmod 0600 vault.pass

echo 'Creating a variable file to store AWS credentials'

ansible-vault create group_vars/all/credentials.yml --vault-password-file vault.pass

rm -f temp.yml

( echo "cat << EOF > ${VAR_DIR}/credentials.yml";
  cat $TEMP_DIR/credentials.yml;
  echo "EOF";
) > temp.yml
. temp.yml

cat $VAR_DIR/credentials.yml

