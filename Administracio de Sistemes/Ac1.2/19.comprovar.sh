#!/bin/bash
clear

comprimir=()

while true; do 
    read -p "Intordueix un fitxer o directori per a comprimir, esriu \"fet\" per a acabar: " input
    if [ "$input" = "fet" ]; then
        break
    elif [ ! -e "$input" ]; then
        echo "El fitxer o directori no existeix!!"
    else
        echo "Afegint \"$input\" a la llista de compressio..."
        comprimir+=("$input")
    fi
done
tar -czf comprimit.tar.gz "${comprimir[@]}"
echo "Arxiu comprès creat: comprimit.tar.gz"
exit 0
