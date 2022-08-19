#!/bin/bash
# создать скрипт,  который проверял бы файлы в папке /etc которые имеют аттрибут директории и выводил их файл etc_dir.txt
find /d/git/usif.project.rep/etc -type d > etc_dir.txt
