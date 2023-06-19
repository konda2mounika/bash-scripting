#!/bin/bash
set -e  # Ensure your scriptwill stop if any of the instruction fails

source components/common.sh

echo -e -n "installing Nginx: "
yum install nginx -y    >> /tmp/frontend.log

systemctl enable nginx

echo -e -n "starting Nginx: "
systemctl start nginx
stat $?

echo -n -e "Downloading the Nginx: "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
stat $? 

cd /usr/share/nginx/html
rm -rf *
unzip -o /tmp/frontend.zip   >> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

echo -e -n "Starting Nginx: "
systemctl restart nginx
stat $? 

# source is a command to import a file and run it locally