#!/bin/bash
#скрипт status.sh, который проверял бы наличие запущенной задачи процесса apache (httpd) и, если она запущена отправлял бы ей команду stop и выводил бы надпись “Process $name $PID stopped”
name=Apache
PID=$(pidof -s apache2)
check_stat=`ps -ef | grep apache2 | grep -v 'grep' | grep -v $0`
result=$(echo $check_stat | grep "$1")
if [[ "$result" != "" ]];then
    sudo systemctl stop apache2
    echo "Process $name $PID stopped"
else
    echo "Apache not Running"
fi