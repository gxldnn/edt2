#!/bin/bash

read -n 1 -p "Escull un numero entre 1 o 2: " num
random=$(( $RANDOM % 2 + 1))

if [ $num -eq $random ];then
    echo -e "\nHas encertat!"
else
    echo -e "\nQuina pena"
fi