#!/bin/bash

echo "Prem una tecla i et diré què és (lletra, número o caràcter especial):"

# Llegir una tecla sense mostrar-la a la pantalla
read -n 1 tecla

# Comprovar si és lletra
if [[ $tecla =~ [a-zA-Z] ]]; then
    echo -e "\nLa tecla '$tecla' és una LLETRA."
# Comprovar si és número
elif [[ $tecla =~ [0-9] ]]; then
    echo -e "\nLa tecla '$tecla' és un NÚMERO."
# Si no és cap de les anteriors, és caràcter especial
else
    echo -e "\nLa tecla '$tecla' és un CARÀCTER ESPECIAL."
fi
