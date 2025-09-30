#!/bin/bash
while true; do
    clear
    read -n 1 -p "Escull un numero entre 1 o 2: " num

    random=$(( $RANDOM % 10 + 1 ))

    if [ $num -eq $random ];then
        echo -e "\nHas encertat! es $random"
        break
    else
        echo -e "\nQuina pena era $random"
    fi
done