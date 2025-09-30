#!/bin/bash


read -p "Escull un numero entre 1 o 2: " num
random=$(( $RANDOM % 2 + 1))

if [ $num -eq $random ];then
    echo -e "Has encertat!"
else
    echo -e "Quina pena"
fi