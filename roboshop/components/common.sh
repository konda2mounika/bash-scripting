# validatiing whether the excuting user is root or not
ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e "\e[42;33m Try excuting the script with sudo or a root user \e[0m"
        exit 1
fi

#Declaring the stat function
stat() {
    if [ $1 -eq 0 ] ; then
        echo -e -n "\e[42;33m Success \e[0m"
    else
        echo -e -n "\e[42;33m Failure.Look for the logs \e[0m"
    fi
}