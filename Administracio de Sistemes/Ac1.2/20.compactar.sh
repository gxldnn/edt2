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
input=$(locate -r "/$name$" | grep -v "Trash") # Buscar el fitxer o directori tre
echo $input

main(){
    if [[ "$input" == *.tar.gz ]]; then
        read -p "Vols descomprimir aquesta arxiu?" decomp
        if [ $decomp = "s" ];then
            read -p "A on el vols, no escriguis res per a compactarlo aqui " pathdecomp
            if [ $pathdecomp = "" ]; then
                tar -zxvf -C $(pwd)
            else
                tar -zxvf -C $pathdecomp
            fi
        fi
    fi
    if [ -f "$input" ]; then
        read -p "Vols llegir el contingut del fitxer? (s/n): " llegir
        if [ "$llegir" = "s" ]; then
            cat "$input" | less
        fi

        read -p "Vols compactar l'arxiu $input? (s/n): " compactararxiu
        if [ "$compactararxiu" = "s" ]; then
            read -p "A on el vols compactar? (enter per a directori actual): " pathca
            if [ -z "$pathca" ]; then
                pathca="$(pwd)"
            fi
            nomfitxer="$(basename "$input")"
            tar cvf "$pathca/$nomfitxer.tar" -C "$(dirname "$input")" "$nomfitxer"
        fi

    elif [ -d "$input" ]; then
        read -p "Vols veure el contingut del directori? (s/n): " veure
        if [ "$veure" = "s" ]; then
            ls -la "$input" | less
        fi

        read -p "Vols compactar aquest directori $input? (s/n): " compactardir
        if [ "$compactardir" = "s" ]; then
            read -p "A on el vols compactar? (enter per a directori actual): " pathcd
            if [ -z "$pathcd" ]; then
                pathcd="$(pwd)"
            fi
            nomdir="$(basename "$input")"
            tar cvf "$pathcd/$nomdir.tar" -C "$(dirname "$input")" "$nomdir"
        fi
    else
        read -p "L'arxiu o directori que dius no existeix o el sistema no el troba, que vols crear ara, un arxiu direcotri o res (a/d/res): " choice
        if [ $choice = "a" ]; then
            read -p "Digues el nom del nou arxiu: " namearxiu
            touch $namearxiu
            read -p "El vols editar ara mateix? (s/n): " modificar
            if [ $modificar = "s" ];then
                nano $namearxiu
            fi
            read -p "El vols comprimir? (s/n)" compactarnew
            if [ "$compactarnew" = "s" ]; then
                read -p "A on el vols compactar? no escriguis res per a guardar en el directori actual: " pathnew
                if [ -z "$pathnew" ]; then
                    pathnew="$(pwd)"
                fi
                namearxiu="$(basename "$namearxiu")"
                tar -cvf "$pathnew/$namearxiu.tar" "$namearxiu" >/dev/null 2>&1
            fi
        elif [ $choice = "d" ];then
            read -p "Digues el nom del nou directoru" namedir
            mkdir -p namedir
        else
            exit 0
        fi
    fi
}

main


