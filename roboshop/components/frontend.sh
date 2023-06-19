#!/bin/bash
set -e  # Ensure your scriptwill stop if any of the instruction fails

source components/common.sh

echo "installing Nginx: "
yum install nginx -y    >> /tmp/frontend.log
if [ $? -eq 0 ] ; then
echo -e "\e[42;33m Success \e[0m"
else
echo -e "\e[42;33m Failure.Look for the logs \e[0m"
fi

systemctl enable nginx
echo "starting Nginx: "
systemctl start nginx

if [ $? -eq 0 ] ; then
echo -e "\e[42;33m Success \e[0m"
else
echo -e "\e[42;33m Failure.Look for the logs \e[0m"
fi

echo "Downloading the Nginx: "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
if [ $? -eq 0 ] ; then
echo -e "\e[42;33m Success \e[0m"
else
echo -e "\e[42;33m Failure.Look for the logs \e[0m"
fi
cd /usr/share/nginx/html
rm -rf *
unzip -o /tmp/frontend.zip   >> /tmp/frontend.log
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

system restart nginx

# source is a command to import a file and run it locally
