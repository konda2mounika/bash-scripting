#!/bin/bash

# case $var in
#     cond1)
#         command 1 ;;
#     cond2)
#         command 2 ;;
#     *)
#         xyz ;;;
#     esac

ACTION=$1

case $ACTION in
    start)
        echo "starting XYZ Service"
        ;;
        stop)
        echo "stoping XYZ Service"
        ;;
        restart)
        echo "Restarting XYZ Service"
        ;;
        *)
        echo -e "\e[42;33m Valid options are start or stop or restart only \e[0m"
esac