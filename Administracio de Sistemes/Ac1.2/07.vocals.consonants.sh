#!/bin/bash
clear

read -p "Introdueix una paraula: " paraula
read -p "Introdueix la longitud: " longitud

pila=0
comptador=1

while [ $comptador -le $longitud ]; do
    aux=$(echo $paraula | cut -c $comptador)

    if [ "$aux" = "a" ]; then
        let pila=pila+1
    elif [ "$aux" = "e" ]; then
        let pila=pila+1
    elif [ "$aux" = "i" ]; then
        let pila=pila+1
    elif [ "$aux" = "o" ]; then
        let pila=pila+1
    elif [ "$aux" = "u" ]; then
        let pila=pila+1
    else
        let pila=pila-1
    fi
    let comptador=comptador+1
done

if [ $pila -eq 0 ]; then
    echo "La paraula $paraula té el mateix nombre de vocals que consonants."
elif [ $pila -gt 0 ]; then
    echo "La paraula $paraula té més vocals que consonants."
else
    echo "La paraula $paraula té menys vocals que consonants."
fi
