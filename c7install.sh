#!/bin/bash

sudo yum install -y wget
sudo wget https://repo.mongodb.org/yum/redhat/mongodb-org-3.1.repo -O /etc/yum.repos.d/mongo.repo
sudo sed -i 's/3.1/3.2/' /etc/yum.repos.d/mongo.repo
sudo yum install -y mongodb-org mongodb-org-server
sudo sed -i '/.*bindIp/d' /etc/mongod.conf

sudo yum -y install epel-release git


sudo yum install -y python2-pip
sudo pip install --upgrade pip
sudo pip install wheel

sudo pip install monotonic
sudo pip install 'zipp<2.0'
sudo pip install six
sudo pip install 'apache-libcloud<3.0'

sudo rpm -e PyYAML python-requests python-ipaddress --nodeps
sudo pip install 'PyYAML==3.12'
sudo pip install 'requests==2.20.0'
sudo pip install 'ipaddress==1.0.17'

~/cbtool/install -r orchestrator >& install1
# rerun it
~/cbtool/install -r orchestrator  >& install2


sudo systemctl restart redis mongod
sudo systemctl enable redis mongod


sudo yum install -y psmisc

echo "Modify ~/cbtool/configs/centos_cloud_definitions.txt set password for demo project in OSK section and select STARTUP_CLOUD MYOSK"
echo "then start ~/cbtool/cb --soft_reset"
