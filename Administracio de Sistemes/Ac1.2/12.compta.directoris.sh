#!/bin/bashz

# Contar directoris i fitxersç

dirs=$(find . -type d | wc -l)
files=$(find . -type f | wc -l)

echo "En el directori actual hi ha $dirs directoris i $files fitxers."