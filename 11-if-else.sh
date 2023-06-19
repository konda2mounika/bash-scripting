#!/bin/bash

ACTION=$1
# demo on if else

# if [ "$ACTION" = "start" ] ; then   
#     echo "Selected choise is start"
# else
#     echo "only valid option is start "
# fi

#Demo on Else if
if [ "$ACTION" = "start" ] ; then
    echo " Starting XYZ Service "
        exit1
    elif [ "$ACTION" = "stop" ] ; then
        echo " Stopping XYZ Service "
        exit2
    elif [ "$ACTION" = "restart" ] ; then
        echo " Restarting XYZ Service "
        exit3
    else
    echo -e "\e[42;33m Valid options are start or stop or restart only \e[0m"
        exit4
fi
     