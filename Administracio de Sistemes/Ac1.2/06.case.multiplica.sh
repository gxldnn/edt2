#!/bin/bash

read -p "Escriu un primer numero: " num1
read -p "Per quin numero el vols multiplicar?(1-10): " num2


if [ $num2 -gt 10 ] || [ $num2 -lt 1 ]; then
    echo "El numero introduit es mes gran que 10 o mes petit que 1"
    exit 1
fi

echo "Resultat = $num1 * $num2 = $(($num1*$num2))"




