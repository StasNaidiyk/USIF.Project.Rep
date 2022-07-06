#!/bin/bash
# скрипт,  который использовал этот текстовый файл и выводил количество строк. Затем брал бы первые 10 результатов и обрезал путь к файлу по символу “/”, оставляя список только имен файлов. Затем перенаправлял в новый файл > cmd_names.
File=usr_executables.txt
Result=cmd_names
wc -l $File > $Result
cat -b $File >> $Result
echo 'Назви перших 10 файлів:' >> $Result
for var in $(head $File) 
do
echo ${var##*/} >> $Result
done