#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    if ! sudo -v &>/dev/null; then
        echo "No tens permisos d'administrador (sudo) ni ets root."
        exit 1
    fi
fi

if ! command -v locate &>/dev/null; then
    echo "El programa locate no esta instalat. Instal·la'l i torna-ho a provar"
    exit 1
fi

read -p "Introdueix un fitxer o directori o tar.gz (El seu nom EXACTE): " name

input=$(locate $name | grep -v "Trash")

main(){
    if [ $input = *.tar.gz ];then
        read -p "Vols descomprimir aquesta arxiu?" decomp
        if [ $decomp = "s" ];then
            read -p "A on el vols, no escriguis res per a compactarlo aqui " pathdecomp
            if [ $pathdecomp = "" ]
                tar -zxvf -C $(pwd)
            else
                tar -zxvf -C $pathdecomp
            fi
        fi
    fi
    if [ -f $input ];then
        read -p "Vols llegir el contingut del fitxer? (s/n): " llegir
        if [ $llegir = "s"];then
            cat $input | less
        fi
        read -p "Vols compactar l'arxiu $input? (s/n): " compactararxiu
        if [ $compactararxiu = "s"]
            read -p "A on el vols compactar? no escriguis res per a guardar en el directori actual: " pathca
            if [ -z $pathca ];then
                tar cvf $input -C $(pwd)
            else
                tar cvf $input -C $pathca
            fi
        fi


    elif [ -d $input ]; then
    read -p "Vols veure el contingut del directori? (s/n): " veure
        if [ $veure = "s"];then
            cat $input | less
        fi
        read -p "Vols compactar aquest directori $input? (s/n): " compactardir
        if [ $compactardir = "s"]
            read -p "A on el vols compactar? no escriguis res per a guardar en el directori actual: " pathcd
            if [ -z $pathcd ];then
                tar cvf $input -C $(pwd)
            else
                tar cvf $input -C $pathcd
            fi
        fi

    else
        read -p "L'arxiu o directori que dius no existeix o el sistema no el troba, que vols crear ara, un arxiu direcotri o res (a/d/res)" choice
        if [ $choice = "a" ]; then
            read -p "Digues el nom del nou arxiu" namearxiu
            touch $namearxiu
            read -p "El vols editar ara mateix?: (s/n)" modificar
            if [ $modificar = "s" ];then
                nano $namearxiu
            fi
            read -p "El vols comprimir? (s/n)" compactarnew
            if [ $compactarnew = "s"]; then
                read -p "A on el vols compactar? no escriguis res per a guardar en el directori actual: " pathnew
                if [ -z $pathnew ];then
                tar cvf $input -C $(pwd)
            else
                tar cvf $input -C $pathcd
            fi

        elif [ $choice = "d" ];then
            read -p "Digues el nom del nou directoru" namedir
            mkdir -p namedir
        else
            
        fi
    fi

}


