#!/bin/bash

apt-get update
cd /tmp
apt-get install git python-pip python-dev
pip install virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh 
mkvirtualenv ansible
pip install ansible
git clone https://github.com/ovnicraft/odoo-ansible.git
mkdir /etc/ansible
echo "localhost ansible_connection=local" > /etc/ansible/hosts
cd odoo_ansible/
ansible-playbook odoo.yml --extra-vars="odoo_version=$2"
