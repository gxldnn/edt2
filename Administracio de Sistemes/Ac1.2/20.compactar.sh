#!/bin/bash

## FLAGS, marquem unes variables com a flags per a no fer cadenes de ifs infinites

function compactar(){

    read -p "Vols $action el contingut del $flagtype? (s/n): " readfile
    if [ "$readfile" = "s" ]; then
        echo "Contingut del $flagtype $input:"
        if [ $action = "veure" ];then
            ls -laF $input
        else
            cat "$input"
        fi
    else
       echo "No es pot $action el contingut de $flagtype" 
    fi
    echo ""
    read -p "Vols comprimir el $flagtype? (s/n): " filecomp
    if [ "$filecomp" = "s" ]; then
        read -p "On vols guardar el $flagtype comprimit (Ruta completa)? Deixa-ho vuit per a desar al directori actual: " pathcomp
        if [ -z $pathcomp ]; then
            pathcomp="."
            tar -czf "comprimit.tar.gz" "$input"
            echo "$flagtype comprimit creat a: $(pwd))\comprimit.tar.gz"
        else
            tar -czf $pathcomp$input.tar.gz "$input"
            echo "$flagtype comprimit creat a: $pathcomp/$input.tar.gz"
        fi
    else
        echo "No es comprimira el $flagtype"
    fi
}

function descompacta(){
    read  -p "Digues el nom d'un arxiu tar.gz o el seu path sencer: " $input
    if [ -e $input ]; then
        read "A on vols descomprimir el arxiu, path completa o relativa, no escriguis res per a guardar aqui: " pathdecomp
        if [ -z $pathdecomp ]; then 
            tar -zxf $input 
            echo "Fitxer descomprès correctament a $(pwd)/$input"
        else
            tar -zxf $input -C $pathdecomp
            echo "Fitxer descomprès correctament a $pathdecomp$input"

        fi
    fi
}

function start(){}
read -p "Introdueix un fitxer o directori per a o veure (tambe si vols, la seva ruta): " input
if [ -f "$input" ]; then 
    flagtype="arxiu"
    action="llegir"
elif [ -d "$input" ]; then
    flagtype="directori"
    action="veure"
else
    echo "El arxiu o directori no existeix!!"
    exit 1
fi

function menu(){
    echo "1. Veure/Leer el contingut del $flagtype"
    echo "2. Comprimir el $flagtype"
    echo "3. Descomprimir un arxiu tar.gz"
    echo "4. Sortir"
    read -p "Tria una opcio (1-4): " option
}
case $option in
    1)
        compactar
    ;;
    2)
        descompacta
    ;;
    3)
        echo "Sortint..."
        exit 0
    ;;
    *)
        echo "Opcio no valida"
        exit 1
    ;;
esac

