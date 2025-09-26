!/bin/bash

read -p "Indica un numero per a comprovar si es prim o no: " num
count=0
for((i=$num; i!=0; i--)); do
    if [ $num  % $i]
        (( count++ ))
    fi
done

if [ $count = 2 ]; then
    echo "El numero es prim"
    else
    echo 