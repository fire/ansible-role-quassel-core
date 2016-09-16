#!/bin/sh -xe

OS_VERSION=$1

ls -l /home
yum install -y epel-release
yum groupinstall -y "Development tools"
yum install -y python-devel libffi-devel python-pip
pip install ansible
ansible --version
printf '[defaults]\nroles_path=../' >ansible.cfg
echo localhost > inventory
ansible-playbook -i inventory --syntax-check --list-tasks test.yml
 ansible-playbook -i inventory --connection=local --become -vvvv test.yml
  - >
    ansible-playbook -i inventory --connection=local --become test.yml
    | grep -q 'changed=0.*failed=0'
    && (echo 'Idempotence test: pass' && exit 0)
    || (echo 'Idempotence test: fail' && exit 1)
quasselcore --version
cat /etc/default/quasselcore

