#!/bin/bash
# скрипт,  который находил бы все файлы *.py  и записывал поток файлов в  file  py_scripts, а ошибки в py_errors
find . -type f -name "*.py" 2> py_errors 1> py_scripts