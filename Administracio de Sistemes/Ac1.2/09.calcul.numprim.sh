#!/bin/bash

read -p "Indica un primer numero per al interval: " num1
read -p "Indica un segon numero per al interval: " num2


primlist=()

if [ $num1 -gt $num2 ];then
        topnum=$num1
        lownum=$num2
    else
        topnum=$num2
        lownum=$num1
fi

for((i=$topnum; i!=$lownum; i--)); do
    for ((i=$topnum; i!=$lownum; i--)); do
        if [ $(($topnum % $i)) -eq 0 ]; then # Si la divisio no es exaxcta "-eq 0" no es compta
            addcount=$((addcount+1))            
        fi
        if [ $addcount -le 2 ]; then # Si el numero te 2 o menys divisors es primer
                primlist+=($i)
            else
                break
        fi
done

echo "Los numeros primos son: ${primlist[@]}"