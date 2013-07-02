#!/bin/sh

setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

yum install -y http://mirror.logol.ru/epel/6/$(arch)/epel-release-6-8.noarch.rpm
yum install -y salt-minion git


mkdir -p /srv/salt
git clone https://github.com/subuk/ispconfig-salt.git /srv/salt

cat >> /etc/salt/minion <<EOF
file_client: local
file_roots:
  base:
    - /srv/salt
EOF

salt-call state.highstate

