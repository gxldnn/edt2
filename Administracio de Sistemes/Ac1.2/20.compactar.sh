#!/bin/bash


# Comprovar si l'usuari té permisos d'administrador esto ho ha fet el GPT la verdad
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

# Sol·licitar el nom del fitxer o directori
read -p "Introdueix un fitxer o directori o tar.gz (El seu nom EXACTE): " name
sudo updatedb # Actualitzar la base de dades de locate
input=$(locate -r "/$name$" | grep -v "Trash") # Buscar el fitxer o directori treient la paperera
echo $input

main(){
    if [[ "$input" == *.tar.gz ]]; then # si es un tar.gz
        read -p "Vols descomprimir aquesta arxiu?" decomp
        if [ $decomp = "s" ];then # si vol descomprimir
            read -p "A on el vols, no escriguis res per a compactarlo aqui " pathdecomp # demana on
            if [ -z $pathdecomp ]; then # si no diu res el descomprimeix en el directori actual
                tar -zxvf -C $(pwd) # descomprimeix en el directori actual
            else
                tar -zxvf -C $pathdecomp # descomprimeix en el directori que ha dit
            fi
        fi
    fi
    if [ -f "$input" ]; then # Si és un fitxer
        read -p "Vols llegir el contingut del fitxer? (s/n): " llegir #     demana si el vol llegir
        if [ "$llegir" = "s" ]; then
            cat "$input" | less
        fi

        read -p "Vols compactar l'arxiu $input? (s/n): " compactararxiu # demana si el vol compactar
        if [ "$compactararxiu" = "s" ]; then
            read -p "A on el vols compactar? (enter per a directori actual): " pathca
            if [ -z "$pathca" ]; then # si no diu res el guarda en el directori actual
                pathca="$(pwd)"
            fi
            nomfitxer="$(basename "$input")" # agafa el nom del fitxer sense la ruta (GPT)
            tar cvf "$pathca/$nomfitxer.tar" -C "$(dirname "$input")" "$nomfitxer" # compacta el fitxer en la ruta que ha dit (GPT)
        fi

    elif [ -d "$input" ]; then # Si és un directori
        read -p "Vols veure el contingut del directori? (s/n): " veure # demana si el vol veure
        if [ "$veure" = "s" ]; then
            ls -la "$input" | less
        fi

        read -p "Vols compactar aquest directori $input? (s/n): " compactardir  # demana si el vol compactar
        if [ "$compactardir" = "s" ]; then
            read -p "A on el vols compactar? (enter per a directori actual): " pathcd # demana on
            if [ -z "$pathcd" ]; then # si no diu res el guarda en el directori actual
                pathcd="$(pwd)"
            fi
            nomdir="$(basename "$input")"
            tar cvf "$pathcd/$nomdir.tar" -C "$(dirname "$input")" "$nomdir" # compacta el directori en la ruta que ha dit
        fi
    else
        read -p "L'arxiu o directori que dius no existeix o el sistema no el troba, que vols crear ara, un arxiu direcotri o res (a/d/res): " choice # demana si vol crear un arxiu o directori
        if [ $choice = "a" ]; then
            read -p "Digues el nom del nou arxiu: " namearxiu # demana el nom
            touch $namearxiu
            read -p "El vols editar ara mateix? (s/n): " modificar
            if [ $modificar = "s" ];then # si vol editar-lo ara mateix
                nano $namearxiu
            fi
            read -p "El vols comprimir? (s/n)" compactarnew # demana si el vol compactar
            if [ "$compactarnew" = "s" ]; then
                read -p "A on el vols compactar? no escriguis res per a guardar en el directori actual: " pathnew # demana on
                if [ -z "$pathnew" ]; then # si no diu res el guarda en el directori actual
                    pathnew="$(pwd)"
                fi
                namearxiu="$(basename "$namearxiu")" # agafa el nom del fitxer sense la ruta (GPT)
                tar -cvf "$pathnew/$namearxiu.tar" "$namearxiu" >/dev/null 2>&1 # compacta el nou arxiu en la ruta que ha dit (GPT)
            fi
        elif [ $choice = "d" ];then # si vol crear un directori
            read -p "Digues el nom del nou directoru" namedir 3 # demana el nom
            mkdir -p namedir
        else
            exit 0
        fi
    fi
}

main


