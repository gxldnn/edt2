#!/bin/bash


read -p "Esolleij un numero en"
random=$(( $RANDOM % 2 + 1))

echo "$random"