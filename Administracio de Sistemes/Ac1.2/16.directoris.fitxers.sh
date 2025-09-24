#!/bin/bash

function menu(){
    echo "Selecciona una opcio del menu:
    1) Tots els directoris que comencin per aquest valor.
    2) Tots els directoris que acabin per aquest valor.
    3) Tots els directoris que continguin aquest valor.
    4) Tots els fitxers que comencin per aquest valor.
    5) Tots els fitxers que acabin per aquest valor.
    6) Tots els fitxers que continguin aquest valor.
    7) Sortir."
}

while true; do
    clear
    menu
    echo "" 
    read -p "Quina opcio vols executar?: " eleccio
    echo ""
    if [ $eleccio = 7 ]; then
            clear 
            echo -e "Has sortit del programa coorectament\n" 
            break
        else
            read -p "Digues el valor a buscar: " valor
    fi
    clear 
    while true; do
        case "$eleccio" in
            1)
                clear
                echo "Directoris que comencin per $valor:"
                find . -type d -name "$valor*"
                echo ""
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            2)
                clear
                echo "Directoris que acabin per $valor:"
                find . -type d -name "*$valor"
                echo ""
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            3)
                clear
                echo "Directoris que continguin $valor:"
                find . -type d -name "*$valor*"
                echo ""
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            4)
                clear
                echo "Fitxers que comencin per $valor:"
                find . -type f -name "$valor*"
                echo ""
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            5)
                clear
                echo "Fitxers que acabin per $valor:"
                find . -type f -name "*$valor"
                echo ""
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            6)
                clear
                echo "Fitxers que continguin $valor:"
                find . -type f -name "*$valor*"
                echo ""
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            7)  
                clear 
                echo -e "Has salido del programa coorectamente\n" 
                exit 0
            ;;
            *)
                echo "Opcio no valida. Torna-ho a intentar."
                read -p
            ;;
        esac
    done
done    

