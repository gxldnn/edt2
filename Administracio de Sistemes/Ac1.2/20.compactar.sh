#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    if ! sudo -v &>/dev/null; then
        echo "No tens permisos d'administrador (sudo) ni ets root."
        exit 1
    fi
fi
if [[ $((which locate)) = false ]]; then
    echo "El programa locate no esta instalat. Instal·la'l i torna-ho a provar"
    exit 1
fi

read -p "Introdueix un fitxer o directori o tar.gz (El seu nom EXACTE): " name

locate $input | grep -v "Trash"

compactar (){


}