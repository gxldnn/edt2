#!/bin/bash

read -p "Introdueix algo jejeej: " algo

if [ -z "$algo" ]; then
    echo "No has introduit res"
elif [ "$algo" -eq "$algo" ] 2>/dev/null; then
    echo "Has introduit un numero"
else
    echo "Has introduit un text"
fi
