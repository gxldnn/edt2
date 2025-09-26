!/bin/bash

read -p "Indica un numero per a comprovar si es prim o no: " num

for((i=1; i<=num; i++)); do
    if [ $num  % $i]