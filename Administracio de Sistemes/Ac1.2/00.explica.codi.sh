#!/bin/bash
read -n 1 tecla
case $tecla in
    [a-z,A-Z])
        echo "Vostè ha introduït una lletra."
    ;;
    [0-9])
        echo "Vostè ha introduït un número."
    ;;
    *) 
        echo "Vostè ha introduit un caràcter especial."
    ;;
esac 