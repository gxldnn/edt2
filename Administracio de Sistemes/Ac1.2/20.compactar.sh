#!/bin/bash

## FLAGS, marquem unes variables com a flags per a no fer cadenes de ifs infinites

function compactar(){

    read -p "Vols $action el contingut del $flagtype? (s/n): " readfile
    if [ "$readfile" = "s" ]; then
        echo "Contingut del $flagtype $1:"
        if [ $action = "veure" ];then
            ls -laF $1
        else
            cat "$1"
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
            tar -czf "comprimit.tar.gz" "$1"
            echo "$flagtype comprimit creat a: $(pwd))\comprimit.tar.gz"
        else
            tar -czf $pathcomp$1.tar.gz "$1"
            echo "$flagtype comprimit creat a: $pathcomp/$1.tar.gz"
        fi
    else
        echo "No es comprimira el $flagtype"
    fi
}

function descompacta(){
    if [ -e $1 ]; then
        read -p "A on vols descomprimir el arxiu, path completa o relativa, no escriguis res per a guardar aqui: " pathdecomp
        if [ -z $pathdecomp ]; then 
            tar -zxf $1 
            echo "Fitxer descomprès correctament a $(pwd)/$1"
        else
            tar -zxf $1 -C $pathdecomp
            echo "Fitxer descomprès correctament a $pathdecomp"

        fi
    fi
}

read -p "Introdueix un fitxer o directori o tar.gz (tambe si vols, la seva ruta): " input


function noexist(){
    if [ ! -e $input ]; then
        echo "El fitxer o directori no existeix"
        
    fi

}
if [[ "$input" == *.tar.gz ]]; then
    descompacta "$input"
else
    compactar "$input"
fi
