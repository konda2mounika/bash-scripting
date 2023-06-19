#!/bin/bash
set -e  # Ensure your scriptwill stop if any of the instruction fails

source components/common.sh

echo -e "installing Nginx: "
yum install nginx -y    >> /tmp/frontend.log

systemctl enable nginx

echo -n "starting Nginx: "
systemctl start nginx
stat $?

echo -n "Downloading the Nginx: "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
stat $? 

cd /usr/share/nginx/html
rm -rf *
echo -n "Extracting the zip file: "
unzip -o /tmp/frontend.zip   >> /tmp/frontend.log
stat $? 

mv frontend-main/* .
mv static/* .
echo -n "Performing Cleanup: "
rm -rf frontend-main README.md
stat $?

echo -n "Configuring the Reverse: "
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Starting Nginx: "
systemctl restart nginx
stat $? 

# source is a command to import a file and run it locally