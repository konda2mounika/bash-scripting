# validatiing whether the excuting user is root or not
ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e "\e[42;33m Try excuting the script with sudo or a root user \e[0m"
        exit 1
fi