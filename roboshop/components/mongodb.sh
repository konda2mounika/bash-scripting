#!/bin/bash
set -e  # Ensure your scriptwill stop if any of the instruction fails

source components/common.sh

COMPONENT=mongodb

echo -n "Configuring the Reverse: "
curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/mongo.repo
stat $?

echo -n "installing ${COMPONENT}: "
yum install -y mongodb-org  >> /tmp/${COMPONENT}.log
stat $?

echo -n "Updating the ${COMPONENT} Config: "
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $?

echo -n "start the $COMPONENT service"
systemctl enable mongd  >> /tmp/${COMPONENT}.log
systemctl start mongod
stat $?