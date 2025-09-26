#!/bin/bash
clear
read -n 1 -p "Introduce 1 numero: " x # Mes atractiu amb text / Autoenter en 1 caracter
echo "" # Salt de linea
case $x in
   1)
      echo "Unitat"
   ;;
   2)
      echo "Dualitat"
   ;;
   3)
      echo "Trinitat"
   ;;
   *)
      echo "no se quin número és $x" # Mes especific
   ;;
esac