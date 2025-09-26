!/bin/bash

read -p "Indica un numero per a comprovar si es prim o no: " num

for((i=$num; i<=num; i++)); do
    if [ $num  % $i]