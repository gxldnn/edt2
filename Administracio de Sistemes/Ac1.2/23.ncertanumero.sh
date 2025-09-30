#!/bin/bash

#read -n 1 -p "Escull un numero entre 1 o 2: " num

for ((i=0; i<1000; i++)); do
    random=$(( $RANDOM % 11))
    echo "$random"
    if     
done






#if [ $num -eq $random ];then
#    echo -e "\nHas encertat!"
#else
#    echo -e "\nQuina pena"
#fi