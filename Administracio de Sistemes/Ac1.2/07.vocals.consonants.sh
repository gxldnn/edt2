#!/bin/bash
clear
read -p "Introdueix una paraula: " paraula
read -p "Introdueix la longitud: " longitud

pila=0
comptador=1
while [ $comptador -le $longitud ]; do
aux=$(echo $paraula | cut -c $comptador)
