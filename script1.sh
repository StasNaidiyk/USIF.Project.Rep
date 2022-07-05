#!/bin/bash
#создать скрипт,  который проверял бы файлы в папке /usr находил из них файлы с атрибутом на исполнение и выводил в файл executable.txt
grep -r "!/bin/" /d/git/usif.project.rep/usr > executable.txt
