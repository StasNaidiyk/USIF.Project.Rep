#!/bin/bash
#Написать скрипт типа предыдущего который бы посылал сигнал SIGTSTP (-18) и выводил в командную строку в течение  30 секунд “process $name $pid suspended”
name=Apache
PID=$(pidof -s apache2)
check_stat=`ps -ef | grep apache2 | grep -v 'grep' | grep -v $0`
result=$(echo $check_stat | grep "$1")
if [[ "$result" != "" ]];then
    kill -18 $PID
    echo "Process $name $PID stopped"
else
    echo "Apache not Running"
fi