#!/bin/bash

read -p "Digues un numero per a mostrar la seva taula de multiplicar : " num

nums=(0 1 2 3 4 5 6 7 8 9)

if  [ $num = 0 ]; then
    echo "El numero es zero, la seva taula es = 0 tot jejejej"
    exit 0
fi


nums=$(($num + 1))
numi=$(($num - 1))

for i in ${nums[@]}; do
    echo -e "$nums * $i = $(($i * $nums))" 
done

echo ""

for i in ${nums[@]}; do
    echo -e "$numi * $i = $(($i * $numi))" 
dones