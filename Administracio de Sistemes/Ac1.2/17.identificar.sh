#!/bin/bash

echo "Prem una tecla i et dire si es lletra, numero o caracter especial:"

# Llegir una tecla sense mostrar-la a la pantalla
read -n1 tecla

# Comprovar si es lletra
if [[ $tecla =~ [a-zA-Z] ]]; then
    echo -e "\nLa tecla \"$tecla es una lletra."
# Comprovar si es numero
elif [[ $tecla =~ [0-9] ]]; then
    echo -e "\nLa tecla $tecla es un numero."
# Si no es cap de les anteriors, es caracter especial
else
    echo -e "\nLa tecla $tecla es un caracter especial."
fi
