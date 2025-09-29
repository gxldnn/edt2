#!/bin/bash

read -p "Indica un numero per a comprovar si es prim o no: " num
count=0
for((i=2; i>$num; i++)); do
    if [ $(($num  % $i)) -eq 0 ]; then # Si la divisio no es exaxcta "-eq 0" no es compta
    echo hola
        (( count++ ))
    fi
done

if [ $count = 1 ]; then
    echo "El numero es prim"
else
    echo "El numero no es prim"
fi