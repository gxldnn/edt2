#!/bin/bash

function sum(){
    result=$(($1 + $2))
    echo "1r numero: $1"
    echo "2r numero: $2"
    echo "Operacio $1 + $2 = $result"
    echo "El resultat de la suma es: $result"
}
function rest(){
    result=$(($1 - $2))
    echo "1r numero: $1"
    echo "2r numero: $2"
    echo "Operacio $1 - $2 = $result"
    echo "El resultat de la resta es: $result"
}
function mult(){
    result=$(($1 * $2))
    echo "1r numero: $1"
    echo "2r numero: $2"
    echo "Operacio $1 * $2 = $result"
    echo "El resultat de la multiplicacio es: $result"
}
function div(){
    result=$(($1 / $2))
    echo "1r numero: $1"
    echo "2r numero: $2"
    echo "Operacio $1 / $2 = $result"
    echo "El resultat de la divisio es: $result"
}

function menu(){
    echo "1. Sumar"
    echo "2. Restar"
    echo "3. Multiplicar"
    echo "4. Dividir"
    echo "0. Salir"
}

while true; do
    clear
    menu
    echo "" 
    read -p "Que vols executar?: " eleccio
    echo ""
    if [ $eleccio = 0 ]; then
            clear 
            echo -e "Has salido del programa coorectamente\n" 
            break
        else
            read -p "Digues el primer numero: " num1
            read -p "Digues el segon numero: " num2
    fi
    clear 
    while true; do
        case "$eleccio" in
            1)
                clear
                sum $num1 $num2
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            2)
                clear
                rest $num1 $num2
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            3)
                clear
                mult $num1 $num2
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            4)
                clear
                div $num1 $num2
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            *)
                echo lol
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
        esac
    done
done
