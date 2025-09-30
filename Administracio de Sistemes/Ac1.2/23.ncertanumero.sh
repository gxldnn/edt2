#!/bin/bash

#read -n 1 -p "Escull un numero entre 1 o 2: " num

for ((i=0; i<10000; i++)); do
    random=$(( $RANDOM % 11))
    echo "$random"
    # comprobar la cuantitat de numeros diferents
    # guardar en un fitxer i despres fer cat fitxer | sort | uniq |
    # si la cuantitat es 11, sortir del bucle
    # if --- IGNORE ---
    
    
done






#if [ $num -eq $random ];then
#    echo -e "\nHas encertat!"
#else
#    echo -e "\nQuina pena"
#fi