#!/bin/bash

read -p "Indica un numero per a comprovar si es prim o no: " num
count=0
for((i=2; i<=$num; i++)); do # For que va des del 2 fins al numero introduit
    if [ $(($num  % $i)) -eq 0 ]; then # Si la divisio  es exaxcta "-eq 0" +
        (( count++ ))
    fi
done

if [ $count = 1 ]; then
    echo "El numero es prim"
else
    echo "El numero no es prim"
fi