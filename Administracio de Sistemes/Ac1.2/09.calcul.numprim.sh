#!/bin/bash

read -p "Indica un primer numero per al interval: " num1
read -p "Indica un segon numero per al interval: " num2

if (( num2 > 1000 || num1 > 1000 )); then
   echo "El numero maxim ha de ser menor que 1000"
   exit 1
fi

primlist=()

# Definim quin es el numero mes alt i quin el mes baix
if (( num1 < num2 )); then
   lownum=$num1
   topnum=$num2
else
   lownum=$num2
   topnum=$num1
fi
for((i=$lownum; i<=$topnum; i++)); do
   count=0

   for((x=2; x<=$i; x++)); do
       if [ $(($i  % $x)) -eq 0 ]; then # Si la divisio no es exaxcta "-eq 0" no es compta
           (( count++ ))
       fi 
   done
   if [ $count = 1 ]; then
       primlist+=(" $i")
      
   fi
done
IFS=","

echo "Els numeros prims dins del rang $lownum - $topnum: ${primlist[*]}"