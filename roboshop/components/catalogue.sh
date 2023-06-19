#!/bin/bash
set -e  # Ensure your scriptwill stop if any of the instruction fails

source components/common.sh

COMPONENT=mongodb
FUSER=roboshop

echo -n " Configure Yum Remos for nodejs: "
curl -sL https://rpm.nodesource.com/setup_16.x |  bash 
stat $?

echo -n "Installing nodejs: "
yum install nodejs -y  >> /tmp/${COMPONENT}.log
stat $?

echo -n "Adding $FUSER user: "
id ${FUSER} >> /tmp/${COMPONENT}.log || useradd ${FUSER}  # Creates users only in case if the user account doesn't exist
stat $?

echo -n " Downloading $COMPONENT: "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip" >> /tmp/${COMPONENT}.log
stat $

echo -n "Cleanup of old $COMPONENT content: "
rm -rf /home/$FUSER/${COMPONENT} >> /tmp/${COMPONENT}.log
stat $

echo -n "Extracting $COMPONENT content: "
cd /home/$FUSER/   >> /tmp/${COMPONENT}.log
unzip -o  /tmp/{COMPONENT}.zip>> /tmp/${COMPONENT}.log && mv ${COMPONENT}-main ${COMPONENT} >> /tmp/${COMPONENT}.log
stat $

echo -n "Changing the ownershipto $FUSER: "
chown -R $FUSER:$FUSER $COMPONENT/  >> /tmp/${COMPONENT}.log
stat $

echo -n "Installing  $COMPONET Dependencies: "
cd $COMPONENT  && npm install  &>> /tmp/${COMPONENT}.log
stat $

echo -n "Configure the Systemd file: "
sed -n -e 's/MONGO_DNSNAME/mongo.roboshop.internal' /home/${FUSER}/${COMPONENT}/systemd.service
mv /home/${FUSER}/${COMPONENT}/systemd.service /etc/systemd/system/catalogue.service
stat $

echo -n "Starting the service"
systemctl daemon-reload  >> /tmp/${COMPONENT}.log
systemctl start ${COMPONENT}    >> /tmp/${COMPONENT}.log
systemctl enable ${COMPONENT}   >> /tmp/${COMPONENT}.log
stat $