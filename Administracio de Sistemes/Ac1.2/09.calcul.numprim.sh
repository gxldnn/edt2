#!/bin/bash

read -p "Indica un primer numero per al interval: " num1
read -p "Indica un segon numero per al interval: " num2

if 

primlist=()

if [ $num1 -gt $num2 ];then
        topnum=$num1
        lownum=$num2
    else
        topnum=$num2
        lownum=$num1
fi

primers=0
for((i=$lownum; i<=$topnum; i++)); do
    (( primers++ ))
    count=0
    for((x=2; x<=$i; x++)); do
        if [ $(($i  % $x)) -eq 0 ]; then # Si la divisio no es exaxcta "-eq 0" no es compta
            (( count++ ))
        fi  
    done

    if [ $count = 1 ]; then
        primlist+=("$i")
        
    fi
    echo $primers
done


echo "Los numeros primos son: ${primlist[@]}"