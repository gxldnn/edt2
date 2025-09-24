#!/bin/bashz

read -p "Digues la ruta del directori on vols comptar directoris i fitxers: " input

if [ ! -d "$input" ]; then
    echo "El directori no existeix!!"
    exit 1
fi

dirs=$(find $input -type d | wc -l)
files=$(find $input -type f | wc -l)

echo "En el directori actual hi ha $dirs directoris i $files fitxers."