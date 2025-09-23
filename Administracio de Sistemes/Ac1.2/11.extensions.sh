#!/bin/bashz
read -p "Digues la extensio dels arxius que vols buscar! : " ext

ls -lx | grep ".$ext" > llistat.txt

echo "S'han guardat els arxius amb extensio .$ext al fitxer llistat.txt"