#!/bin/bash

read -p "Digues un numero per a mostrar el seu factorial "!" : " num


if ! [[ "$num" =~ ^[0-9]+$ ]] || [ "$num" -le 0 ]; then ## mirar si es text 0 si es major que 0
    echo "Numero invalid o zero."
    exit 0
fi

savenum=$num # Guardem el valor del input del usuari
altnum=$num 
result=1
detallat=()
while [ $num -ne 0 ]; do # Mentres num no sigui 0 fes:
    result=$(($result * $num))
    detallat+=("$num") 
    (( num-- ))

done

IFS="*" # Es una forma de posar un separador de linea m'ho ha dit chatGPT IFS vol dir Internal Field Separator y s'ha de definitr per a poder usarlo en el detallat[*]
echo "El factorial de $savenum es ${detallat[*]} = $result"