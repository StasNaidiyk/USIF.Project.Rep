#!/bin/bash
# скрипт,  который проверял бы файлы в папке /usrі/sbin и находил из них только те, у которых есть атрибут на запуск и чтение. Список таких файлов выводится в файл usr_executables.txt
find /d/git/USIF.Project.Rep/usri/sbin -type f -perm /u=rx  > usr_executables.txt
 