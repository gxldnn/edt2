#!/bin/bash

read -p "Indica un numero per a comprovar si es prim o no: " num
count=0
for((i=$num; i!=0; i--)); do
    if [ $(($num  % $i)) -eq 0 ]; then # Si la divisio no es exaxcta "-eq 0" no es compta
        (( count++ ))
    fi
done

if [ $count = 2 ]; then
    echo "El numero es prim"
else
    echo "El numero no es prim"
fi