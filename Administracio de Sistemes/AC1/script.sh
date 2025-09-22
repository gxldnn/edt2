#!/bin/bash

function menu(){
    echo "1. Comprovar si un fitxer o directori existeix"
    echo "2. Comprovar els permisos d'un fitxer"
    echo "3. Comprovar si un fitxer es vuit o no"
    echo "4. Comprovar si un fitxer es un directori"
    echo "5. Comprovar si dos nombres són iguals, diferents, majors o menors"
    echo "6. Comprovar si una cadena de text està buida o no"
    echo "7. omprovar si dues cadenes de text són iguals o diferents"
    echo "8. Comprovar si una condició es compleix amb una lògica combinada (AND / OR):"
    echo "9. Comprovar si un fitxer o directori existeix amb negació"
    echo "0. Sortir"
}

# 1. Comprovar si un fitxer o directori existeix:
function comprovar_fitxer_o_directori(){
    read -p "Que fitxer o dir vols comprovar?: " input
    if [ -f "$input" ]; then
        echo "El fitcher \"$input\" existeix!!"
        ls -l "$input"
    elif [ -d "$input" ]; then
        echo "El dir $input existeix!!"
    else
        echo "No existeix ni un dir ni un arxiu amb aquest nom"
    fi
}

# 2. Comprovar si el fitxer és llegible, escrivible o executable:
function comprovar_permisos(){
    read -p "En quin fitxer vols comprovar els permisos?: " input
    resposta="El teu arxiu te permisos de:"
    if [ -d "$input" ]; then
        echo "Aixo es un directori!!"
    fi

    if [ -r "$input" ]; then
        resposta+=" Lectura"
    fi
    
    if [ -x "$input" ]; then
        resposta+=" Execució"
    fi

    if [ -w "$input" ]; then
        resposta+=" Escritura"
    fi
    echo "$resposta"
    ls -l "$input"
}

# 3. Comprovar si el fitxer noi la  està buit
function comprovar_no_buit(){
    read -p "Quin fitxer vols comprobar?: " input
    if [ -s "$input" ]; then
        echo "El fitxer $input NO esta vuit!!"
    else
        echo "El fitcher \"$input\" esta vuit!!"
    fi
    ls -l "$input"
}

# 4. Comprovar si un fitxer és regular o un directori:
function comprovar_tipus(){
    read -p "Quin nom es el que vols comprobar?: " input 
    if [ -f "$input" ]; then
        echo "El fitxer $input es un arxiu!!"
        ls -l "$input"
    elif [ -d "$input" ]; then 
        echo "El fitcher \"$input\" es un directori!!"
        ls -l | grep "$input"
    else
        echo "No existeix aquest nom!"
    fi
}

# 5. Comprovar si dos nombres són iguals, diferents, majors o menors:
function comprovar_numeros(){
    read -p "Escriu el primer numero: " input
    read -p "Escriu el segon numero: " input2
    
    if [ $input == $input2 ]; then
        echo "Els numeros son iguals!"
    elif [ $input -gt $input2 ]; then
        echo "El numero $input en mes gran que $input2"
    else
        echo "El numero $input es mes petit que $input2"
    fi
}

# 6. Comprovar si una cadena de text està buida o no:
function comprovar_cadena(){
    read -p "Escriu el teu missatge: " input
    if [ -z "$input" ]; then
        echo "El misstage del usuari es vuit"
    else
        echo "El misatge del usuari te contigut i es: $input"
    fi
}

# 7. Comprovar si dues cadenes de text són iguals o diferents:
function comprovar_textes(){
    read -p "Escriu el teu primer missatge: " input
    read -p "Escriu el teu segon missatge: " input2
        
    if [ $input = $input2 ]; then
        echo "El primer missatge es igual que el segon"
    else
        echo -e "Els missatges del son diferents y els contiguts son: \n 1. $input\n 2. $input2"
    fi
}

# 8. Comprovar si una condició es compleix amb una lògica combinada (AND / OR):
function comprovar_logica(){
    read -p "Escriu el nom de l'arxiu: " input
    read -p "Escriu el nom del directori: " input2

    if [ -f "$input" ] && [ -d "$input2" ] ; then
        echo "El fitxer $input i el directori $input2 extisteixen!!"
        ls -l | grep "$input"
        ls -l | grep "$input2"
    elif [ -f "$input" ] && [ ! -d "$input2" ] ; then
        echo "El directori \"$input2\" no existeix!!, pero el fitxer \"$input\" si!!"
        ls -l | grep "$input"
    elif [ ! -f "$input" ] && [ -d "$input2" ] ; then
        echo "El arxiu \"$input\" no existeix!!, pero el directori \"$input2\" si!!"
        ls -l | grep "$input2"
    else
        echo "No s existeix ningun arxiu ni directori amb aquests noms"
    fi
}

# 9. Negar una condició amb !:
function comprovar_negacio(){
    read -p "Quin fitxer vols comprovar?: " input
    if [ ! -e "$input" ]; then
        echo "El fitxer o directori no existeix!!"
    else
        echo "El fitxer o directori si existeix!!"
        ls -l "$input"
    fi
}

while true; do
    clear
    menu
    echo "" 
    read -p "Que vols executar?: " eleccio
    clear 
    while true; do
        case "$eleccio" in
            1)
                clear
                comprovar_fitxer_o_directori
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            2)
                clear
                comprovar_permisos
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            3)
                clear
                comprovar_no_buit
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            4)
                clear
                comprovar_tipus
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            5)
                clear
                comprovar_numeros
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            6)
                clear
                comprovar_cadena
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            7)
                clear
                comprovar_textes
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            8)
                clear
                comprovar_logica
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            9)
                clear
                comprovar_negacio
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
            0)  
                clear 
                echo -e "Has salido del programa coorectamente\n" 
                exit 0
            ;;
            *)
                echo lol
                read -p "Presiona [ENTER] per a tornar al menu...."
                break
            ;;
        esac
    done
done
