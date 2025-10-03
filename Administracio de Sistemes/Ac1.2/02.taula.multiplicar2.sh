#!/bin/bash

read -p "Digues un numero per a mostrar la seva taula de multiplicar : " num

nums=(0 1 2 3 4 5 6 7 8 9) # Llista de numeros

if ! [[ "$num" =~ ^[0-9]+$ ]] || [ "$num" -le 0 ]; then ## mirar si es text 0 si es major que 0
    echo "Numero invalid o zero."
    exit 0
fi


nummas=$(($num + 1)) # Calcula el numero mes 1 
nummenos=$(($num - 1)) # Calcula el numero menos 1  


for i in ${nums[@]}; do # 
    echo -e "$nummas * $i = $(($i * $nummas))"  # for que recorre amb unnumero mes
done

echo "" # espaiar

for i in ${nums[@]}; do
    echo -e "$nummenos * $i = $(($i * $nummenos))"  # for que recorre amb un numero menys
done