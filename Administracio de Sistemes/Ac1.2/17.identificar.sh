#!/bin/bash

echo "Prem una input i et diré què és (lletra, número o caràcter especial):"

# Llegir una input sense mostrar-la a la pantalla
read -n 1 input

# Comprovar si és lletra
if [[ $input =~ [a-zA-Z] ]]; then
    echo -e "\nLa input '$input' és una LLETRA."
# Comprovar si és número
elif [[ $input =~ [0-9] ]]; then
    echo -e "\nLa input '$input' és un NÚMERO."
# Si no és cap de les anteriors, és caràcter especial
else
    echo -e "\nLa input '$input' és un CARÀCTER ESPECIAL."
fi
