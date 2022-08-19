#!/bin/bash
#Модифицировать предыдущий скрипт, чтобы он проверял наличие демона в памяти через 10 секунд после команды stop и если он еще работает посылал бы команду SIGTERM (-9)
name=Apache
PID=$(pidof -s apache2)
check_stat=`ps -ef | grep apache2 | grep -v 'grep' | grep -v $0`
result=$(echo $check_stat | grep "$1")
if [[ "$result" != "" ]];then
    sudo systemctl stop apache2
    echo "Process $name $PID stopped"
    sleep 10  #delay
    kill -9 $PID
    echo "Process $name $PID killed"
else
    echo "Apache is not running"
fi